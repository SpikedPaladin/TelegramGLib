namespace Telegram {
    
    public class MessageOriginUser : MessageOrigin {
        public User sender_user;
        
        public MessageOriginUser(Json.Object object) {
            date = object.get_int_member("date");
            sender_user = new User(object.get_object_member("sender_user"));
        }
    }
}