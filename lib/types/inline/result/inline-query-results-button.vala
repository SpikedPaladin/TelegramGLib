namespace Telegram.Types {
	
	public class InlineQueryResultsButton : Object, Serializable {
	    public string text;
	    public WebAppInfo? web_app;
	    public string? start_parameter;
	    
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("text");
            builder.add_string_value(text);
            
            if (web_app != null) {
                builder.set_member_name("web_app");
                builder.add_value(web_app.serialize());
            }
            
            if (start_parameter != null) {
                builder.set_member_name("start_parameter");
                builder.add_string_value(start_parameter);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
	}
}
