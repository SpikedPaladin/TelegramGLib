namespace Telegram.Types {
	
    public class Contact {
        public string phone_number;
        public string first_name;
        public string? last_name;
        public int64? user_id;
        public string? vcard;
        
        public Contact(Json.Object object) {
            phone_number = object.get_string_member("phone_number");
            first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("user_id"))
                user_id = object.get_int_member("user_id");
            
            if (object.has_member("vcard"))
                vcard = object.get_string_member("vcard");
        }
    }
}
