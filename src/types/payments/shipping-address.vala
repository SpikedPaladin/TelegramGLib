namespace Telegram {
    
    public class ShippingAddress {
        public string country_code;
        public string state;
        public string city;
        public string street_line1;
        public string street_line2;
        public string post_code;
        
        public ShippingAddress(Json.Object object) {
            country_code = object.get_string_member("country_code");
            state = object.get_string_member("state");
            city = object.get_string_member("city");
            street_line1 = object.get_string_member("street_line1");
            street_line2 = object.get_string_member("street_line1");
            post_code = object.get_string_member("post_code");
        }
    }
}
