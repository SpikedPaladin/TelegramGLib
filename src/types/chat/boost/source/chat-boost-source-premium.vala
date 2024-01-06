namespace Telegram {
    
    public class ChatBoostSourcePremium : Object, ChatBoostSource {
        public User user;
        
        public ChatBoostSourcePremium(Json.Object object) {
            user = new User(object.get_object_member("user"));
        }
    }
}