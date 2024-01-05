namespace Telegram {
    
    public class ChatMemberMember : Object, ChatMember {
        public User user;
        
        public ChatMemberMember(Json.Object object) {
            user = new User(object.get_object_member("user"));
        }
    }
}
