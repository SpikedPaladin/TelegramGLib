namespace Telegram {
    
    public class InlineQueryResultVideo : Object, Serializable, InlineQueryResult {
        public string id = Uuid.string_random();
        public string video_url;
        public string mime_type;
        public string thumbnail_url;
        public string title;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? video_width;
        public int? video_height;
        public int? video_duration;
        public string? description;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("video");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("video_url");
            builder.add_string_value(video_url);
            
            builder.set_member_name("mime_type");
            builder.add_string_value(mime_type);
            
            builder.set_member_name("thumbnail_url");
            builder.add_string_value(thumbnail_url);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (video_width != null) {
                builder.set_member_name("video_width");
                builder.add_int_value(video_width);
            }
            
            if (video_height != null) {
                builder.set_member_name("video_height");
                builder.add_int_value(video_height);
            }
            
            if (video_duration != null) {
                builder.set_member_name("video_duration");
                builder.add_int_value(video_duration);
            }
            
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
