namespace Telegram {
    
    public class MessageOriginUser : MessageOrigin, Object {
        public Type type;
        public int64 date;
        public User sender_user;
        
        public MessageOriginUser(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            date = object.get_int_member("date");
            sender_user = new User(object.get_object_member("sender_user"));
        }
    }
}