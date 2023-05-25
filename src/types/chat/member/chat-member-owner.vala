namespace Telegram.Types {
	
    public class ChatMemberOwner : Object, ChatMember {
        public Status status;
        public User user;
        public bool is_anonymous;
        public string? custom_title;
        
        public ChatMemberOwner(Json.Object object) {
            status = Status.parse(object.get_string_member("status"));
            user = new User(object.get_object_member("user"));
            is_anonymous = object.get_boolean_member("is_anonymous");
            
            if (object.has_member("custom_title"))
                custom_title = object.get_string_member("custom_title");
        }
    }
}
