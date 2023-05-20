namespace Telegram.Types {
	
    public class LoginUrl : Object, Serializable {
        public string url;
        public string? forward_text;
        public string? bot_username;
        public bool? request_write_access;
        
        public LoginUrl(Json.Object object) {
            url = object.get_string_member("url");
            
            if (object.has_member("forward_text"))
                forward_text = object.get_string_member("forward_text");
            
            if (object.has_member("bot_username"))
                bot_username = object.get_string_member("bot_username");
            
            if (object.has_member("request_write_access"))
                request_write_access = object.get_boolean_member("request_write_access");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.set_member_name("url");
            builder.add_string_value(url);
            
            if (forward_text != null) {
                builder.set_member_name("forward_text");
                builder.add_string_value(forward_text);
            }
            
            if (bot_username != null) {
                builder.set_member_name("bot_username");
                builder.add_string_value(bot_username);
            }
            
            if (request_write_access != null) {
                builder.set_member_name("request_write_access");
                builder.add_boolean_value(request_write_access);
            }
            
            return builder.get_root();
        }
    }
}
