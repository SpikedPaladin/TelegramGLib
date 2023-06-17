namespace Telegram {
    
    public class ChatMemberLeft : Object, ChatMember {
        public Status status;
        public User user;
        
        public ChatMemberLeft(Json.Object object) {
            status = Status.parse(object.get_string_member("status"));
            user = new User(object.get_object_member("user"));
        }
    }
}
