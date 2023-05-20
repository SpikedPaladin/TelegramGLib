namespace Telegram.Types {
	
    public class InlineQueryResultDocument : Object, Serializable, InlineQueryResult {
        public string id;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public string document_url;
        public string mime_type;
        public string? description;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        public string? thumbnail_url;
        public int? thumbnail_width;
        public int? thumbnail_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("document");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("document_url");
            builder.add_string_value(document_url);
            
            builder.set_member_name("mime_type");
            builder.add_string_value(mime_type);
            
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
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            if (thumbnail_url != null) {
                builder.set_member_name("thumbnail_url");
                builder.add_string_value(thumbnail_url);
            }
            
            if (thumbnail_width != null) {
                builder.set_member_name("thumbnail_width");
                builder.add_int_value(thumbnail_width);
            }
            
            if (thumbnail_height != null) {
                builder.set_member_name("thumbnail_height");
                builder.add_int_value(thumbnail_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
