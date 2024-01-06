namespace Telegram {
    
    public class ReplyParameters : Object, Serializable {
        public int message_id;
        public ChatId? chat_id;
        public bool? allow_sending_without_reply;
        public string? quote;
        public ParseMode? quote_parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? quote_entities;
        public int? quote_position;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("message_id");
            builder.add_int_value(message_id);
            
            chat_id?.append(builder);
            
            if (allow_sending_without_reply != null) {
                builder.set_member_name("allow_sending_without_reply");
                builder.add_boolean_value(allow_sending_without_reply);
            }
            
            if (quote != null) {
                builder.set_member_name("quote");
                builder.add_string_value(quote);
            }
            
            if (quote_parse_mode != null) {
                builder.set_member_name("quote_parse_mode");
                builder.add_string_value(quote_parse_mode.to_string());
            }
            
            if (quote_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in quote_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("quote_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (quote_position != null) {
                builder.set_member_name("quote_position");
                builder.add_int_value(quote_position);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}