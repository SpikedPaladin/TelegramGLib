namespace Telegram {
    
    /**
     * A client to use the Telegram Bot API
     */
    public class Bot : Object {
        /**
         * Bot configuration
         */
        public BotConfig config = new BotConfig.default();
        private List<AbstractHandler> handlers = new List<AbstractHandler>();
        
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
        
        public void add_handler(AbstractHandler handler) {
            handler.bot = this;
            
            handlers.append(handler);
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
            
            if (response == null || !response.ok)
                return null;
            
            return new UserProfilePhotos(response.result.get_object());
        }
        
        public async TelegramFile? get_file(string file_id) {
            var response = yield make_request("getFile", @"file_id=$file_id");
            
            if (response == null || !response.ok)
                return null;
            
            return new TelegramFile(response.result.get_object());
        }
        
        public async Chat? get_chat(ChatId chat_id) {
            var response = yield make_request("getChat", @"chat_id=$chat_id");
            
            if (response == null || !response.ok)
                return null;
            
            return new Chat(response.result.get_object());
        }
        
        public async ChatMember? get_chat_administrators(ChatId chat_id) {
            var response = yield make_request("getChatAdministrators", @"chat_id=$chat_id");
            
            if (response == null || !response.ok)
                return null;
            
            return ChatMember.from_json(response.result.get_object());
        }
        
        public async int? get_chat_member_count(ChatId chat_id) {
            var response = yield make_request("getChatMemberCount", @"chat_id=$chat_id");
            
            if (response == null || !response.ok)
                return null;
            
            return (int) response.result.get_int();
        }
        
        public async ChatMember? get_chat_member(ChatId chat_id, int64 user_id) {
            var response = yield make_request("getChatMember", @"chat_id=$chat_id&user_id=$user_id");
            
            if (response == null || !response.ok)
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
            
            if (response == null || !response.ok)
                return null;
            
            return new BotName(response.result.get_object());
        }
        
        public async BotDescription? get_my_description(string? language_code = null) {
            string queue = null;
            
            if (language_code != null)
                queue += @"language_code=$language_code";
            
            var response = yield make_request("getMyDescription", queue);
            
            if (response == null || !response.ok)
                return null;
            
            return new BotDescription(response.result.get_object());
        }
        
        public async BotShortDescription? get_my_short_description(string? language_code = null) {
            string queue = null;
            
            if (language_code != null)
                queue += @"language_code=$language_code";
            
            var response = yield make_request("getMyShortDescription", queue);
            
            if (response == null || !response.ok)
                return null;
            
            return new BotShortDescription(response.result.get_object());
        }
        
        public async MenuButton? get_chat_menu_button(ChatId? chat_id = null) {
            string queue = null;
            
            if (chat_id != null)
                queue += @"chat_id=$chat_id";
            
            var response = yield make_request("getChatMenuButton", queue);
            
            if (response == null || !response.ok)
                return null;
            
            return MenuButton.from_json(response.result.get_object());
        }
        
        public async ChatAdministratorRights? get_my_default_administrator_rights(bool? for_channels = null) {
            string queue = null;
            
            if (for_channels != null)
                queue += @"for_channels=$for_channels";
            
            var response = yield make_request("getMyDefaultAdministratorRights", queue);
            
            if (response == null || !response.ok)
                return null;
            
            return new ChatAdministratorRights(response.result.get_object());
        }
        
        public async StickerSet? get_sticker_set(string name) {
            var response = yield make_request("getStickerSet", @"name=$name");
            
            if (response == null || !response.ok)
                return null;
            
            return new StickerSet(response.result.get_object());
        }
        
        public async Sticker[]? get_custom_emoji_stickers(string[] custom_emoji_ids) {
            var response = yield make_request("getCustomEmojiStickers", @"custom_emoji_ids=$(Util.serialize_array(custom_emoji_ids))");
            
            if (response == null || !response.ok)
                return null;
            
            Sticker[] result = {};
            foreach (var element in response.result.get_array().get_elements())
                result += new Sticker(element.get_object());
            
            return result;
        }
        
        public async GameHighScore[]? get_game_high_scores(int64 user_id, ChatId? chat_id = null, int? message_id = null, string? inline_message_id = null) {
            var queue = @"user_id=$user_id";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            var response = yield make_request("getGameHighScores", queue);
            
            if (response == null || !response.ok)
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
                
                if (config.debug)
                    Util.log(@"$endpoint: $(Json.to_string(node, false))", Util.LogLevel.DEBUG);
                
                if (!response.ok)
                    Util.log(@"$endpoint: $(response.description)", Util.LogLevel.WARNING);
                
                return response;
            } catch (Error e) {
                Util.log(@"Error while making request: $(e.message)", Util.LogLevel.WARNING);
                return null;
            }
        }
        
        private async void get_updates() {
            self = yield get_me();
            
            if (self == null) {
                Util.log("Failed to authorize", Util.LogLevel.ERROR);
                
                return;
            }
            
            Util.log(@"Authorized on account $(self.username)");
            
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
                    
                    // Route update processing to specific signal or delegate
                    if (update.message != null && update.message.is_command() && on_command(update.message))
                        return;
                    
                    if (update.message != null && on_message(update.message))
                        return;
                    
                    if (update.edited_message != null && on_edited_message(update.edited_message))
                        return;
                    
                    if (update.channel_post != null && on_channel_post(update.channel_post))
                        return;
                    
                    if (update.edited_channel_post != null && on_edited_channel_post(update.edited_channel_post))
                        return;
                    
                    if (update.inline_query != null && on_inline_query(update.inline_query))
                        return;
                    
                    if (update.chosen_inline_result != null && on_chosen_inline_result(update.chosen_inline_result))
                        return;
                    
                    if (update.callback_query != null && on_callback_query(update.callback_query))
                        return;
                    
                    if (update.shipping_query != null && on_shipping_query(update.shipping_query))
                        return;
                    
                    if (update.pre_checkout_query != null && on_pre_checkout_query(update.pre_checkout_query))
                        return;
                    
                    if (update.poll != null && on_poll(update.poll))
                        return;
                    
                    if (update.poll_answer != null && on_poll_answer(update.poll_answer))
                        return;
                    
                    if (update.my_chat_member != null && on_my_chat_member(update.my_chat_member))
                        return;
                    
                    if (update.chat_member != null && on_chat_member(update.chat_member))
                        return;
                    
                    if (update.chat_join_request != null && on_chat_join_request(update.chat_join_request))
                        return;
                    
                    // Update processing with on_update signal
                    on_update(update);
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
                        Util.log(@"$(request.method()): $(Json.to_string(node, false))", Util.LogLevel.DEBUG);
                    
                    if (!response.ok)
                        Util.log(@"$(request.method()): $(response.description)", Util.LogLevel.WARNING);
                    
                    return response;
                } catch (Error e) {
                    Util.log(@"Error while making request: $(e.message)", Util.LogLevel.WARNING);
                }
            }
            return yield make_request(request.method(), request.queue());
        }
        
        /**
         * Override this method to do update processing
         */
        public virtual signal void on_update(Update update) {}
        
        public virtual signal bool on_command(Message message) {
            foreach (var handler in handlers) {
                if (handler is CommandHandler) {
                    var command_handler = handler as CommandHandler;
                    
                    if ((command_handler.command == null || command_handler.command == "" || command_handler.command == message.get_command_name()) && (command_handler.condition == null || command_handler.condition(message))) {
                        command_handler.action(message);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        public virtual signal bool on_message(Message message) {
            foreach (var handler in handlers) {
                if (handler is MessageHandler) {
                    var message_handler = handler as MessageHandler;
                    
                    if ((message_handler.text == null || message_handler.text == "" || message_handler.text == message.text) && (message_handler.condition == null || message_handler.condition(message))) {
                        message_handler.action(message);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        public virtual signal bool on_edited_message(Message edited_message) { return false; }
        
        public virtual signal bool on_channel_post(Message channel_post) { return false; }
        
        public virtual signal bool on_edited_channel_post(Message edited_channel_post) { return false; }
        
        public virtual signal bool on_inline_query(InlineQuery inline_query) {
            foreach (var handler in handlers) {
                if (handler is InlineQueryHandler) {
                    var query_handler = handler as InlineQueryHandler;
                    
                    if ((query_handler.query == null || query_handler.query == inline_query.query) && (query_handler.condition == null || query_handler.condition(inline_query))) {
                        query_handler.action(inline_query);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        public virtual signal bool on_chosen_inline_result(ChosenInlineResult chosen_inline_result) {
            foreach (var handler in handlers) {
                if (handler is ChosenInlineQueryResultHandler) {
                    var result_handler = handler as ChosenInlineQueryResultHandler;
                    
                    if ((result_handler.result_id == null || result_handler.result_id == chosen_inline_result.result_id) && (result_handler.condition == null || result_handler.condition(chosen_inline_result))) {
                        result_handler.action(chosen_inline_result);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        public virtual signal bool on_callback_query(CallbackQuery callback_query) {
            foreach (var handler in handlers) {
                if (handler is CallbackQueryHandler) {
                    var query_handler = handler as CallbackQueryHandler;
                    
                    if ((query_handler.data == null || query_handler.data == "" || (callback_query.data != null && query_handler.data == callback_query.data)) && (query_handler.condition == null || query_handler.condition(callback_query))) {
                        query_handler.action(callback_query);
                        
                        return true;
                    }
                }
            }
            return false;
        }
        
        public virtual signal bool on_shipping_query(ShippingQuery shipping_query) { return false; }
        
        public virtual signal bool on_pre_checkout_query(PreCheckoutQuery pre_checkout_query) { return false; }
        
        public virtual signal bool on_poll(Poll poll) { return false; }
        
        public virtual signal bool on_poll_answer(Poll.Answer poll_answer) { return false; }
        
        public virtual signal bool on_my_chat_member(ChatMemberUpdated my_chat_member) { return false; }
        
        public virtual signal bool on_chat_member(ChatMemberUpdated chat_member) { return false; }
        
        public virtual signal bool on_chat_join_request(ChatJoinRequest chat_join_request) { return false; }
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
        public Bytes? bytes;
        public abstract bool has_attachments();
        public abstract async Soup.Multipart create_multipart() throws Error;
    }
}
