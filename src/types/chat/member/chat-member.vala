namespace Telegram.Types {
	
    public class ChatMember {
        public Status status;
        public User user;
        
        public ChatMember(Json.Object object) {
            status = Status.parse(object.get_string_member("status"));
            user = new User(object.get_object_member("user"));
        }
        
        public enum Status {
            CREATOR,
            ADMINISTRATOR,
            MEMBER,
            RESTRICTED,
            LEFT,
            KICKED;
            
            public static Status? parse(string status) {
                switch (status) {
                    case "creator":
                        return CREATOR;
                    case "administrator":
                        return ADMINISTRATOR;
                    case "member":
                        return MEMBER;
                    case "restricted":
                        return RESTRICTED;
                    case "left":
                        return LEFT;
                    case "kicked":
                        return KICKED;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case CREATOR:
                        return "creator";
                    case ADMINISTRATOR:
                        return "administrator";
                    case MEMBER:
                        return "member";
                    case RESTRICTED:
                        return "restricted";
                    case LEFT:
                        return "left";
                    case KICKED:
                        return "kicked";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
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
    
    public class ChatMemberMember : ChatMember {
        
        public ChatMemberMember(Json.Object object) {
            base(object);
        }
    }
    
    public class ChatMemberRestricted : ChatMember {
        public bool is_member;
        public bool can_send_messages;
        public bool can_send_audios;
        public bool can_send_documents;
        public bool can_send_photos;
        public bool can_send_videos;
        public bool can_send_video_notes;
        public bool can_send_voice_notes;
        public bool can_send_polls;
        public bool can_send_other_messages;
        public bool can_add_web_page_previews;
        public bool can_change_info;
        public bool can_invite_users;
        public bool can_pin_messages;
        public bool can_manage_topics;
        public int64 until_date;
        
        
        public ChatMemberRestricted(Json.Object object) {
            base(object);
            
            is_member = object.get_boolean_member("is_member");
            can_send_messages = object.get_boolean_member("can_send_messages");
            can_send_audios = object.get_boolean_member("can_send_audios");
            can_send_documents = object.get_boolean_member("can_send_documents");
            can_send_photos = object.get_boolean_member("can_send_photos");
            can_send_videos = object.get_boolean_member("can_send_videos");
            can_send_video_notes = object.get_boolean_member("can_send_video_notes");
            can_send_voice_notes = object.get_boolean_member("can_send_voice_notes");
            can_send_polls = object.get_boolean_member("can_send_polls");
            can_send_other_messages = object.get_boolean_member("can_send_other_messages");
            can_add_web_page_previews = object.get_boolean_member("can_add_web_page_previews");
            can_change_info = object.get_boolean_member("can_change_info");
            can_invite_users = object.get_boolean_member("can_invite_users");
            can_pin_messages = object.get_boolean_member("can_pin_messages");
            can_manage_topics = object.get_boolean_member("can_manage_topics");
            until_date = object.get_int_member("until_date");
        }
    }
    
    public class ChatMemberLeft : ChatMember {
        
        public ChatMemberLeft(Json.Object object) {
            base(object);
        }
    }
    
    public class ChatMemberBanned : ChatMember {
        public int64 until_date;
        
        public ChatMemberBanned(Json.Object object) {
            base(object);
            
            until_date = object.get_int_member("until_date");
        }
    }
}
