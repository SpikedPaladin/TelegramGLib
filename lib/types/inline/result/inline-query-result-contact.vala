namespace Telegram.Types {
	
    public class InlineQueryResultContact : Object, Serializable, InlineQueryResult {
        public string id;
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumbnail_url;
        public int? thumbnail_width;
        public int? thumbnail_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("contact");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("phone_number");
            builder.add_string_value(phone_number);
            
            builder.set_member_name("first_name");
            builder.add_string_value(first_name);
            
            if (last_name != null) {
                builder.set_member_name("last_name");
                builder.add_string_value(last_name);
            }
            
            if (vcard != null) {
                builder.set_member_name("vcard");
                builder.add_string_value(vcard);
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
