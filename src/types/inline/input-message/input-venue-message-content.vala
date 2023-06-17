namespace Telegram {
    
    public class InputVenueMessageContent : Object, Serializable, InputMessageContent {
        public double latitude;
        public double longitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
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
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
