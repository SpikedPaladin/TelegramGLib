namespace Telegram.Types {
	
    public class ChatMemberAdministrator : ChatMember {
        public bool can_be_edited;
        public bool is_anonymous;
        public bool can_manage_chat;
        public bool can_delete_messages;
        public bool can_manage_video_chats;
        public bool can_restrict_members;
        public bool can_promote_members;
        public bool can_change_info;
        public bool can_invite_users;
        public bool? can_post_messages;
        public bool? can_edit_messages;
        public bool? can_pin_messages;
        public bool? can_manage_topics;
        public string? custom_title;
        
        public ChatMemberAdministrator(Json.Object object) {
            base(object);
            
            can_be_edited = object.get_boolean_member("can_be_edited");
            is_anonymous = object.get_boolean_member("is_anonymous");
            can_manage_chat = object.get_boolean_member("can_manage_chat");
            can_delete_messages = object.get_boolean_member("can_delete_messages");
            can_manage_video_chats = object.get_boolean_member("can_manage_video_chats");
            can_restrict_members = object.get_boolean_member("can_restrict_members");
            can_promote_members = object.get_boolean_member("can_promote_members");
            can_change_info = object.get_boolean_member("can_change_info");
            can_invite_users = object.get_boolean_member("can_invite_users");
            
            if (object.has_member("can_post_messages"))
                can_post_messages = object.get_boolean_member("can_post_messages");
            
            if (object.has_member("can_edit_messages"))
                can_edit_messages = object.get_boolean_member("can_edit_messages");
            
            if (object.has_member("can_pin_messages"))
                can_pin_messages = object.get_boolean_member("can_pin_messages");
            
            if (object.has_member("can_manage_topics"))
                can_manage_topics = object.get_boolean_member("can_manage_topics");
            
            if (object.has_member("custom_title"))
                custom_title = object.get_string_member("custom_title");
        }
    }
}
