namespace Telegram {
    
    public class InlineQueryResultArticle : Object, Serializable, InlineQueryResult {
        public string id;
        public string title;
        public InputMessageContent input_message_content;
        public InlineKeyboardMarkup? reply_markup;
        public string? url;
        public bool? hide_url;
        public string? description;
        public string? thumbnail_url;
        public int? thumbnail_width;
        public int? thumbnail_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("article");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("input_message_content");
            builder.add_value(input_message_content.serialize());
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (hide_url != null) {
                builder.set_member_name("hide_url");
                builder.add_boolean_value(hide_url);
            }
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
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
