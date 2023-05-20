namespace Telegram.Types {
	
    public class InlineQueryResultVenue : Object, Serializable, InputMessageContent {
        public string id;
        public double latitude;
        public double longitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumbnail_url;
        public int? thumbnail_width;
        public int? thumbnail_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("venue");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("address");
            builder.add_string_value(address);
            
            if (foursquare_id != null) {
                builder.set_member_name("foursquare_id");
                builder.add_string_value(foursquare_id);
            }
            
            if (foursquare_type != null) {
                builder.set_member_name("foursquare_type");
                builder.add_string_value(foursquare_type);
            }
            
            if (google_place_id != null) {
                builder.set_member_name("google_place_id");
                builder.add_string_value(google_place_id);
            }
            
            if (google_place_type != null) {
                builder.set_member_name("google_place_type");
                builder.add_string_value(google_place_type);
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
