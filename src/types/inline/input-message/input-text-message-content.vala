namespace Telegram {
    
    public class InputTextMessageContent : Object, Serializable, InputMessageContent {
        public string message_text;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? entities;
        public LinkPreviewOptions? link_preview_options;
        
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
            
            if (link_preview_options != null) {
                builder.set_member_name("link_preview_options");
                builder.add_value(link_preview_options.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
