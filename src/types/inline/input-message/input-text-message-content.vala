namespace Telegram.Types {
	
    public class InputTextMessageContent : Object, Serializable, InputMessageContent {
        public string message_text;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? entities;
        public bool? disable_web_page_preview;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("message_text");
            builder.add_string_value(message_text);
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (entities != null) {
                Serializable[] arr = {};
                foreach (var entity in entities) {
                    arr += entity;
                }
                
                builder.set_member_name("entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (disable_web_page_preview != null) {
                builder.set_member_name("disable_web_page_preview");
                builder.add_boolean_value(disable_web_page_preview);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
