namespace Telegram.Types {
	
    public class InlineQueryResultGif : Object, Serializable, InlineQueryResult {
        public string id;
        public string gif_url;
        public int? gif_width;
        public int? gif_height;
        public int? gif_duration;
        public string thumbnail_url;
        public string? thumbnail_mime_type;
        public string? title;
        public string? caption;
        public Requests.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("gif");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("gif_url");
            builder.add_string_value(gif_url);
            
            builder.set_member_name("thumbnail_url");
            builder.add_string_value(thumbnail_url);
            
            if (gif_width != null) {
                builder.set_member_name("gif_width");
                builder.add_int_value(gif_width);
            }
            
            if (gif_height != null) {
                builder.set_member_name("gif_height");
                builder.add_int_value(gif_height);
            }
            
            if (gif_duration != null) {
                builder.set_member_name("gif_duration");
                builder.add_int_value(gif_duration);
            }
            
            if (thumbnail_mime_type != null) {
                builder.set_member_name("thumbnail_mime_type");
                builder.add_string_value(thumbnail_mime_type);
            }
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
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
