namespace Telegram.Types {
	
    public class WriteAccessAllowed {
        public string? web_app_name;
        
        public WriteAccessAllowed(Json.Object object) {
            if (object.has_member("web_app_name"))
                web_app_name = object.get_string_member("web_app_name");
        }
    }
}
