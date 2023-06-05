namespace Telegram {
    
    public class ChatMemberUpdated {
        public Chat chat;
        public User from;
        public int64 date;
        public ChatMember old_chat_member;
        public ChatMember new_chat_member;
        public ChatInviteLink? invite_link;
        public bool? via_chat_folder_invite_link;
        
        public ChatMemberUpdated(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            from = new User(object.get_object_member("from"));
            date = object.get_int_member("date");
            old_chat_member = ChatMember.from_json(object.get_object_member("old_chat_member"));
            new_chat_member = ChatMember.from_json(object.get_object_member("new_chat_member"));
            
            if (object.has_member("invite_link"))
                invite_link = new ChatInviteLink(object.get_object_member("invite_link"));
            
            if (object.has_member("via_chat_folder_invite_link"))
                via_chat_folder_invite_link = object.get_boolean_member("via_chat_folder_invite_link");
        }
    }
}
