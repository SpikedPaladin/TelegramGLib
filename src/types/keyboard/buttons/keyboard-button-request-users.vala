namespace Telegram {
    
    public class KeyboardButtonRequestUsers : Object, Serializable {
        public int request_id;
        public bool? user_is_bot;
        public bool? user_is_premium;
        public int? max_quantity;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("request_id");
            builder.add_int_value(request_id);
            
            if (user_is_bot != null) {
                builder.set_member_name("user_is_bot");
                builder.add_boolean_value(user_is_bot);
            }
            
            if (user_is_premium != null) {
                builder.set_member_name("user_is_premium");
                builder.add_boolean_value(user_is_premium);
            }
            
            if (max_quantity != null) {
                builder.set_member_name("max_quantity");
                builder.add_int_value(max_quantity);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
