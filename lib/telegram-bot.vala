using Telegram.Configs;
using Telegram.Types;

namespace Telegram {
    
    public abstract class Bot : Object {
        public Soup.Session session;
        private int update_id;
        public string token;
        public User? self;
        public bool debug;
        
        construct {
            session = new Soup.Session();
        }
        
        public void start() {
            get_updates.begin();
        }
        
        public async Response? make_request(string endpoint, string? @params = null) {
            var message = new Soup.Message("POST", @"https://api.telegram.org/bot$token/$endpoint?$(params ?? "")");
            
            try {
                var stream = yield session.send_async(message);
                var parser = new Json.Parser();
                yield parser.load_from_stream_async(stream);
                
                var node = parser.get_root();
                var response = new Response(node.get_object());
                
                if (debug)
                    Util.log(Util.LogLevel.DEBUG, @"$endpoint: $(Json.to_string(node, false))");
                
                if (!response.ok)
                    Util.log(Util.LogLevel.WARNING, @"$endpoint: $(response.description)");
                
                return response;
            } catch (Error e) {
                Util.log(Util.LogLevel.WARNING, @"Error while making request: $(e.message)");
                return null;
            }
        }
        
        private async void get_updates() {
            self = yield get_me();
            
            if (self == null) {
                Util.log(Util.LogLevel.ERROR, "Failed to authorize");
                
                return;
            }
            
            Util.log(Util.LogLevel.INFO, @"Authorized on account $(self.username)");
            
            while (true) {
                var @params = "timeout=60";
                
                if (update_id != 0)
                    @params += @"&offset=$update_id";
                
                var response = yield make_request("getUpdates", @params);
                var array = response.result.get_array();
                
                array.foreach_element((array, index, node) => {
                    Update update = new Update(node.get_object());
                    
                    if (update.update_id >= update_id)
                        update_id = update.update_id + 1;
                    
                    update_recieved(update);
                });
            }
        }
        
        public async User? get_me() {
            var response = yield make_request("getMe");
            
            if (response == null || !response.ok)
                return null;
            
            return new User(response.result.get_object());
        }
        
        public async BotCommand[]? get_my_commands() {
            var response = yield make_request("getMyCommands");
            
            if (response == null || !response.ok)
                return null;
            
            BotCommand[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new BotCommand(element.get_object());
            
            return result;
        }
        
        public async TelegramFile? get_file(string file_id) {
            var response = yield make_request("getFile", @"file_id=$file_id");
            
            if (response != null || !response.ok)
                return null;
            
            return new TelegramFile(response.result.get_object());
        }
        
        public async Chat? get_chat(string chat_id) {
            var response = yield make_request("getChat", @"chat_id=$chat_id");
            
            if (response != null || !response.ok)
                return null;
            
            return new Chat(response.result.get_object());
        }
        
        public async Response? send(BaseConfig config) {
            if (config is UploadConfig && config.has_attachments()) {
                var upload_config = config as UploadConfig;
                
                try {
                    var multipart = yield upload_config.create_multipart();
                    var message = Soup.Form.request_new_from_multipart(@"https://api.telegram.org/bot$token/$(config.method())?$(config.queue())", multipart);
                    
                    var stream = yield session.send_async(message);
                    var parser = new Json.Parser();
                    yield parser.load_from_stream_async(stream);
                    
                    var node = parser.get_root();
                    var response = new Response(node.get_object());
                    
                    if (debug)
                        Util.log(Util.LogLevel.DEBUG, @"$(config.method()): $(Json.to_string(node, false))");
                    
                    if (!response.ok)
                        Util.log(Util.LogLevel.WARNING, @"$(config.method()): $(response.description)");
                    
                    return response;
                } catch (Error e) {
                    Util.log(Util.LogLevel.WARNING, @"Error while making request: $(e.message)");
                }
            }
            return yield make_request(config.method(), config.queue());
        }
        
        public abstract void update_recieved(Update update);
    }
}
