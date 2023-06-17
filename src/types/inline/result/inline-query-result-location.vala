namespace Telegram {
    
    public class InlineQueryResultLocation : Object, Serializable, InlineQueryResult {
        public string id = Uuid.string_random();
        public double longitude;
        public double latitude;
        public string title;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumbnail_url;
        public int? thumbnail_width;
        public int? thumbnail_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("location");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (horizontal_accuracy != null) {
                builder.set_member_name("horizontal_accuracy");
                builder.add_double_value(horizontal_accuracy);
            }
            
            if (live_period != null) {
                builder.set_member_name("live_period");
                builder.add_int_value(live_period);
            }
            
            if (heading != null) {
                builder.set_member_name("heading");
                builder.add_int_value(heading);
            }
            
            if (proximity_alert_radius != null) {
                builder.set_member_name("proximity_alert_radius");
                builder.add_int_value(proximity_alert_radius);
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
