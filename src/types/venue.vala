namespace Telegram {
    
    public class Venue : Object {
        public Location location;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        
        public Venue(Json.Object object) {
            location = new Location(object.get_object_member("location"));
            title = object.get_string_member("title");
            address = object.get_string_member("address");
            
            if (object.has_member("foursquare_id"))
                foursquare_id = object.get_string_member("foursquare_id");
            
            if (object.has_member("inline_message_id"))
                foursquare_type = object.get_string_member("foursquare_type");
            
            if (object.has_member("google_place_id"))
                google_place_id = object.get_string_member("google_place_id");
            
            if (object.has_member("google_place_type"))
                google_place_type = object.get_string_member("google_place_type");
        }
    }
}
