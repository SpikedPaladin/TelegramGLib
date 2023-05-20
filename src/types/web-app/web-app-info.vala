namespace Telegram.Types {
	
    public class WebAppInfo : Object, Serializable {
        public string url;
        
        public WebAppInfo(Json.Object object) {
            url = object.get_string_member("url");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("url");
            builder.add_string_value(url);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
