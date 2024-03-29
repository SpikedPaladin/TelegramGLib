namespace Telegram {
    
    public class CallbackQuery : Object {
        public string id;
        public User from;
        public MaybeInaccessibleMessage? message;
        public string? inline_message_id;
        public string chat_instance;
        public string? data;
        public string? game_short_name;
        
        public CallbackQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            chat_instance = object.get_string_member("chat_instance");
            
            if (object.has_member("message"))
                message = MaybeInaccessibleMessage.from_json(object.get_object_member("message"));
            
            if (object.has_member("inline_message_id"))
                inline_message_id = object.get_string_member("inline_message_id");
            
            if (object.has_member("data"))
                data = object.get_string_member("data");
            
            if (object.has_member("game_short_name"))
                game_short_name = object.get_string_member("game_short_name");
        }
    }
}
