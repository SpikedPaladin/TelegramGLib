namespace Telegram {
    
    public class ChatAdministratorRights : Object, Serializable {
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
        
        public ChatAdministratorRights(Json.Object object) {
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
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("is_anonymous");
            builder.add_boolean_value(is_anonymous);
            
            builder.set_member_name("can_manage_chat");
            builder.add_boolean_value(can_manage_chat);
            
            builder.set_member_name("can_delete_messages");
            builder.add_boolean_value(can_delete_messages);
            
            builder.set_member_name("can_manage_video_chats");
            builder.add_boolean_value(can_manage_video_chats);
            
            builder.set_member_name("can_restrict_members");
            builder.add_boolean_value(can_restrict_members);
            
            builder.set_member_name("can_promote_members");
            builder.add_boolean_value(can_promote_members);
            
            builder.set_member_name("can_change_info");
            builder.add_boolean_value(can_change_info);
            
            builder.set_member_name("can_invite_users");
            builder.add_boolean_value(can_invite_users);
            
            if (can_post_messages != null) {
                builder.set_member_name("can_post_messages");
                builder.add_boolean_value(can_post_messages);
            }
            
            if (can_edit_messages != null) {
                builder.set_member_name("can_edit_messages");
                builder.add_boolean_value(can_edit_messages);
            }
            
            if (can_post_messages != null) {
                builder.set_member_name("can_pin_messages");
                builder.add_boolean_value(can_pin_messages);
            }
            
            if (can_post_messages != null) {
                builder.set_member_name("can_manage_topics");
                builder.add_boolean_value(can_manage_topics);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
