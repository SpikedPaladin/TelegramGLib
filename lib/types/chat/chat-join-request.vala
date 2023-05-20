namespace Telegram.Types {
	
    public class ChatJoinRequest {
        public Chat chat;
        public User from;
        public int64 user_chat_id;
        public int64 date;
        public string? bio;
        public ChatInviteLink? invite_link;
        
        public ChatJoinRequest(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            from = new User(object.get_object_member("from"));
            user_chat_id = object.get_int_member("user_chat_id");
            date = object.get_int_member("date");
            
            if (object.has_member("bio"))
                bio = object.get_string_member("bio");
            
            if (object.has_member("invite_link"))
                invite_link = new ChatInviteLink(object.get_object_member("invite_link"));
        }
    }
}
