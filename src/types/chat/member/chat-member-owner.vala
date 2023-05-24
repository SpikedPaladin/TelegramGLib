namespace Telegram.Types {
	
    public class ChatMemberOwner : ChatMember {
        public bool is_anonymous;
        public string? custom_title;
        
        public ChatMemberOwner(Json.Object object) {
            base(object);
            
            is_anonymous = object.get_boolean_member("is_anonymous");
            
            if (object.has_member("custom_title"))
                custom_title = object.get_string_member("custom_title");
        }
    }
}
