namespace Telegram {
    
    public class ChatBoostSourceGiftCode : Object, ChatBoostSource {
        public User user;
        
        public ChatBoostSourceGiftCode(Json.Object object) {
            user = new User(object.get_object_member("user"));
        }
    }
}