namespace Telegram.Types {
	
    public class KeyboardButton : Object, Serializable {
        public string text;
        public KeyboardButtonRequestUser? request_user;
        public KeyboardButtonRequestChat? request_chat;
        public bool? request_contact;
        public bool? request_location;
        public KeyboardButtonPollType? request_poll;
        public WebAppInfo? web_app;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("text");
            builder.add_string_value(text);
            
            if (request_user != null) {
                builder.set_member_name("request_user");
                builder.add_value(request_user.serialize());
            }
            
            if (request_chat != null) {
                builder.set_member_name("request_chat");
                builder.add_value(request_chat.serialize());
            }
            
            if (request_contact != null) {
                builder.set_member_name("request_contact");
                builder.add_boolean_value(request_contact);
            }
            
            if (request_location != null) {
                builder.set_member_name("request_location");
                builder.add_boolean_value(request_location);
            }
            
            if (request_poll != null) {
                builder.set_member_name("request_poll");
                builder.add_value(request_poll.serialize());
            }
            
            if (web_app != null) {
                builder.set_member_name("web_app");
                builder.add_value(web_app.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
