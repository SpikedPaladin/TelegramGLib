namespace Telegram {
    
    public class WriteAccessAllowed : Object {
        public bool? from_request;
        public string? web_app_name;
        public bool? from_attachment_menu;
        
        public WriteAccessAllowed(Json.Object object) {
            if (object.has_member("from_request"))
                from_request = object.get_boolean_member("from_request");
            
            if (object.has_member("web_app_name"))
                web_app_name = object.get_string_member("web_app_name");
            
            if (object.has_member("from_attachment_menu"))
                from_attachment_menu = object.get_boolean_member("from_attachment_menu");
        }
    }
}
