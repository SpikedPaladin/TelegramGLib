namespace Telegram {
    
    public class ChatBoostRemoved : Object {
        public Chat chat;
        public string boost_id;
        public int64 remove_date;
        public ChatBoostSource source;
        
        public ChatBoostRemoved(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            boost_id = object.get_string_member("boost_id");
            remove_date = object.get_int_member("remove_date");
            source = ChatBoostSource.from_json(object.get_object_member("source"));
        }
    }
}