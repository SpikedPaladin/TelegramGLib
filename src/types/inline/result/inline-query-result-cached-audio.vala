namespace Telegram {
    
    public class InlineQueryResultCachedAudio : Object, Serializable, InlineQueryResult {
        public string id = Uuid.string_random();
        public string audio_file_id;
        public string? caption;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("audio");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("audio_file_id");
            builder.add_string_value(audio_file_id);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
