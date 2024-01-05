namespace Telegram {
    
    public class ChatBoostSourceGiftCode : ChatBoostSource, Object {
        public User user;
        
        public ChatBoostSourceGiftCode(Json.Object object) {
            user = new User(object.get_object_member("user"));
        }
    }
}