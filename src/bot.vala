namespace Telegram {
    
    /**
     * A client to use the Telegram Bot API
     */
    public abstract class Bot : Object {
        /**
         * Bot configuration
         */
        public BotConfig config = BotConfig.default();
        
        /**
         * Http session
         */
        public Soup.Session session;
        private int update_id;
        /**
         * API token
         */
        public string token;
        /**
         * Information about bot
         */
        public User? self;
        /**
         * Enable debug log  
         * Deprecated. Use {@link BotConfig.debug} to enable debug mode
         * Will be removed in 0.4.0
         */
        [CCode(notify = false)]
        [Version (deprecated = true, deprecated_since = "0.3.0", replacement = "config")]
        public bool debug { set { config.debug = value; } get { return config.debug; } }
        /**
         * {@link GLib.MainLoop} which created when bot started with {@link BotConfig.create_main_loop} set to ''True''
         */
        public MainLoop? main_loop;
        
        construct {
            session = new Soup.Session();
        }
        
        public void start() {
            if (config.create_main_loop)
                main_loop = new MainLoop();
            
            get_updates.begin();
            
            main_loop?.run();
        }
        
        public async User? get_me() {
            var response = yield make_request("getMe");
            
            if (response == null || !response.ok)
                return null;
            
            return new User(response.result.get_object());
        }
        
        public async UserProfilePhotos? get_user_profile_photos(int64 user_id, int? offset = null, int? limit = null) {
            var queue = @"user_id=$user_id";
            
            if (offset != null)
                queue += @"&offset=$offset";
            
            if (limit != null)
                queue += @"&limit=$limit";
            
            var response = yield make_request("getUserProfilePhotos", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return new UserProfilePhotos(response.result.get_object());
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
        
        public async ChatMember? get_chat_administrators(int64 chat_id) {
            var response = yield make_request("getChatAdministrators", @"chat_id=$chat_id");
            
            if (response != null || !response.ok)
                return null;
            
            return ChatMember.from_json(response.result.get_object());
        }
        
        public async int? get_chat_member_count(int64 chat_id) {
            var response = yield make_request("getChatMemberCount", @"chat_id=$chat_id");
            
            if (response != null || !response.ok)
                return null;
            
            return (int) response.result.get_int();
        }
        
        public async ChatMember? get_chat_member(int64 chat_id, int64 user_id) {
            var response = yield make_request("getChatMember", @"chat_id=$chat_id&user_id=$user_id");
            
            if (response != null || !response.ok)
                return null;
            
            return ChatMember.from_json(response.result.get_object());
        }
        
        public async Sticker[]? get_forum_topic_icon_stickers() {
            var response = yield make_request("getForumTopicIconStickers");
            
            if (response == null || !response.ok)
                return null;
            
            Sticker[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new Sticker(element.get_object());
            
            return result;
        }
        
        public async BotCommand[]? get_my_commands(BotCommandScope? scope = null, string? language_code = null) {
            string queue = null;
            
            if (scope != null)
                queue += @"scope=$scope";
            
            if (language_code != null) {
                if (scope != null) queue += "&";
                queue += @"language_code=$language_code";
            }
            
            var response = yield make_request("getMyCommands", queue);
            
            if (response == null || !response.ok)
                return null;
            
            BotCommand[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new BotCommand(element.get_object());
            
            return result;
        }
        
        public async BotName? get_my_name(string? language_code = null) {
            string queue = null;
            
            if (language_code != null)
                queue += @"language_code=$language_code";
            
            var response = yield make_request("getMyName", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return new BotName(response.result.get_object());
        }
        
        public async BotDescription? get_my_description(string? language_code = null) {
            string queue = null;
            
            if (language_code != null)
                queue += @"language_code=$language_code";
            
            var response = yield make_request("getMyDescription", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return new BotDescription(response.result.get_object());
        }
        
        public async BotShortDescription? get_my_short_description(string? language_code = null) {
            string queue = null;
            
            if (language_code != null)
                queue += @"language_code=$language_code";
            
            var response = yield make_request("getMyShortDescription", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return new BotShortDescription(response.result.get_object());
        }
        
        public async MenuButton? get_chat_menu_button(int64? chat_id = null) {
            string queue = null;
            
            if (chat_id != null)
                queue += @"chat_id=$chat_id";
            
            var response = yield make_request("getChatMenuButton", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return MenuButton.from_json(response.result.get_object());
        }
        
        public async ChatAdministratorRights? get_my_default_administrator_rights(bool? for_channels = null) {
            string queue = null;
            
            if (for_channels != null)
                queue += @"for_channels=$for_channels";
            
            var response = yield make_request("getMyDefaultAdministratorRights", queue);
            
            if (response != null || !response.ok)
                return null;
            
            return new ChatAdministratorRights(response.result.get_object());
        }
        
        public async StickerSet? get_sticker_set(string name) {
            var response = yield make_request("getStickerSet", @"name=$name");
            
            if (response != null || !response.ok)
                return null;
            
            return new StickerSet(response.result.get_object());
        }
        
        public async Sticker[]? get_custom_emoji_stickers(string[] custom_emoji_ids) {
            var response = yield make_request("getCustomEmojiStickers", @"custom_emoji_ids=$(Util.serialize_array(custom_emoji_ids))");
            
            if (response != null || !response.ok)
                return null;
            
            Sticker[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new Sticker(element.get_object());
            
            return result;
        }
        
        public async GameHighScore[]? get_game_high_scores(int64 user_id, int64? chat_id = null, int? message_id = null, string? inline_message_id = null) {
            var queue = @"user_id=$user_id";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            var response = yield make_request("getGameHighScores", queue);
            
            if (response != null || !response.ok)
                return null;
            
            GameHighScore[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new GameHighScore(element.get_object());
            
            return result;
        }
        
        public async Response? make_request(string endpoint, string? @params = null) {
            var message = new Soup.Message("GET", @"https://api.telegram.org/bot$token/$endpoint?$(params ?? "")");
            
            try {
                var stream = yield session.send_async(message, Priority.DEFAULT, null);
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
                var @params = @"timeout=$(config.timeout)";
                
                if (config.limit != null)
                    @params += @"&limit=$(config.limit)";
                
                if (config.allowed_updates != null)
                    @params += @"allowed_updates=$(config.allowed_updates)";
                
                if (update_id != 0)
                    @params += @"&offset=$update_id";
                
                var response = yield make_request("getUpdates", @params);
                
                // Response will be null if something wrong with connection
                // Like timed out or no network
                if (response == null) {
                    
                    // Retry after one second to protect from log spaming
                    Timeout.add(1000,
                        () => get_updates.callback(),
                        Priority.DEFAULT
                    );
                    
                    yield; continue;
                }
                
                var array = response.result.get_array();
                
                array.foreach_element((array, index, node) => {
                    Update update = new Update(node.get_object());
                    
                    if (update.update_id >= update_id)
                        update_id = update.update_id + 1;
                    
                    update_recieved(update);
                });
            }
        }
        
        /**
         * Send request to Bot API
         * @param request A request to send
         * @return {@link Response} from Bot API
         */
        public async Response? send(BaseRequest request) {
            if (request is UploadRequest && request.has_attachments()) {
                var upload_request = request as UploadRequest;
                
                try {
                    var multipart = yield upload_request.create_multipart();
                    var message = new Soup.Message.from_multipart(@"https://api.telegram.org/bot$token/$(request.method())?$(request.queue())", multipart);
                    
                    var stream = yield session.send_async(message, Priority.DEFAULT, null);
                    var parser = new Json.Parser();
                    yield parser.load_from_stream_async(stream);
                    
                    var node = parser.get_root();
                    var response = new Response(node.get_object());
                    
                    if (config.debug)
                        Util.log(Util.LogLevel.DEBUG, @"$(request.method()): $(Json.to_string(node, false))");
                    
                    if (!response.ok)
                        Util.log(Util.LogLevel.WARNING, @"$(request.method()): $(response.description)");
                    
                    return response;
                } catch (Error e) {
                    Util.log(Util.LogLevel.WARNING, @"Error while making request: $(e.message)");
                }
            }
            return yield make_request(request.method(), request.queue());
        }
        
        public abstract void update_recieved(Update update);
    }
    
    protected interface InputMediaGroupable : Object, Serializable, InputMedia {}
    
    protected interface InlineQueryResult : Object, Serializable {}
    
    protected interface ReplyMarkup : Object, Serializable {}
    
    protected interface Serializable : Object {
        public abstract Json.Node serialize();
        
        public virtual string to_string() {
            return Json.to_string(serialize(), false);
        }
        
        public static Json.Node serialize_array(Serializable[] array) {
            var builder = new Json.Builder();
            
            builder.begin_array();
            
            foreach (var item in array) {
                builder.add_value(item.serialize());
            }
            
            builder.end_array();
            
            return builder.get_root();
        }
        
        public static string array_to_string(Serializable[] array) {
            return Json.to_string(serialize_array(array), false);
        } 
    }
    
    public enum ParseMode {
        MARKDOWN,
        MARKDOWNV2,
        HTML;
        
        public string to_string() {
            switch (this) {
                case MARKDOWN:
                    return "Markdown";
                case MARKDOWNV2:
                    return "MarkdownV2";
                case HTML:
                    return "HTML";
                default:
                    return "Undefined";
            }
        }
    }
    
    public abstract class BaseRequest : Object {
        public abstract string method();
        public abstract string queue();
    }
    
    public abstract class UploadRequest : BaseRequest {
        public abstract bool has_attachments();
        public abstract async Soup.Multipart create_multipart() throws Error;
    }
}
