namespace Telegram.Types {
	
    public class ChatMemberMember : Object, ChatMember {
        public Status status;
        public User user;
        
        public ChatMemberMember(Json.Object object) {
            status = Status.parse(object.get_string_member("status"));
            user = new User(object.get_object_member("user"));
        }
    }
}
