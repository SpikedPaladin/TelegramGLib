namespace Telegram {
    
    public class WebAppData : Object, Serializable {
        public string data;
        public string button_text;
        
        public WebAppData(Json.Object object) {
            data = object.get_string_member("data");
            button_text = object.get_string_member("button_text");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("data");
            builder.add_string_value(data);
            
            builder.set_member_name("button_text");
            builder.add_string_value(button_text);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
