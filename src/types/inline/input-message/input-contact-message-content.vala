namespace Telegram.Types {
	
    public class InputContactMessageContent : Object, Serializable, InputMessageContent {
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
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
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
