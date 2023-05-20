namespace Telegram.Types {
	
    public class InlineQueryResultCachedSticker : Object, Serializable, InlineQueryResult {
        public string id;
        public string sticker_file_id;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("sticker");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("sticker_file_id");
            builder.add_string_value(sticker_file_id);
            
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
