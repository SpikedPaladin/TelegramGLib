namespace Telegram {
    
    public class ChatBoost : Object {
        public string boost_id;
        public int64 add_date;
        public int64 expiration_date;
        public ChatBoostSource source;
        
        public ChatBoost(Json.Object object) {
            boost_id = object.get_string_member("boost_id");
            add_date = object.get_int_member("add_date");
            expiration_date = object.get_int_member("expiration_date");
            source = ChatBoostSource.from_json(object.get_object_member("source"));
        }
    }
}