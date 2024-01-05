namespace Telegram {
    
    public class ChatMemberLeft : Object, ChatMember {
        public User user;
        
        public ChatMemberLeft(Json.Object object) {
            user = new User(object.get_object_member("user"));
        }
    }
}
