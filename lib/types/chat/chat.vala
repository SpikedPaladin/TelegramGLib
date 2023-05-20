namespace Telegram.Types {
    
    public class Chat {
        public int64 id;
        public Type type;
        public string? title;
        public string? username;
        public string? first_name;
        public string? last_name;
        public bool is_forum;
        public ChatPhoto? photo;
        public string[]? active_usernames;
        public string? emoji_status_custom_emoji_id;
        public string? bio;
        public bool has_private_forwards;
        public bool has_restricted_voice_and_video_messages;
        public bool join_to_send_messages;
        public bool join_by_request;
        public string? description;
        public string? invite_link;
        public Message? pinned_message;
        public ChatPermissions? permissions;
        public int? slow_mode_delay;
        public int? message_auto_delete_time;
        public bool has_aggressive_anti_spam_enabled;
        public bool has_hidden_members;
        public bool has_protected_content;
        public string? sticker_set_name;
        public bool can_set_sticker_set;
        public int64? linked_chat_id;
        public ChatLocation? location;
        
        public Chat(Json.Object object) {
            id = object.get_int_member("id");
            type = Type.parse(object.get_string_member("type"));
            
            if (object.has_member("title"))
                title = object.get_string_member("title");
            
            if (object.has_member("username"))
                username = object.get_string_member("username");
            
            if (object.has_member("first_name"))
                first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("is_forum"))
                is_forum = object.get_boolean_member("is_forum");
            
            if (object.has_member("photo"))
                photo = new ChatPhoto(object.get_object_member("photo"));
            
            if (object.has_member("active_usernames")) {
                string[] temp = {};
                
                foreach (var element in object.get_array_member("active_usernames").get_elements())
                    temp += element.get_string();
                
                active_usernames = temp;
            }
            
            if (object.has_member("emoji_status_custom_emoji_id"))
                emoji_status_custom_emoji_id = object.get_string_member("emoji_status_custom_emoji_id");
            
            if (object.has_member("bio"))
                bio = object.get_string_member("bio");
            
            if (object.has_member("has_private_forwards"))
                has_private_forwards = object.get_boolean_member("has_private_forwards");
            
            if (object.has_member("has_restricted_voice_and_video_messages"))
                has_restricted_voice_and_video_messages = object.get_boolean_member("has_restricted_voice_and_video_messages");
            
            if (object.has_member("join_to_send_messages"))
                join_to_send_messages = object.get_boolean_member("join_to_send_messages");
            
            if (object.has_member("join_by_request"))
                join_by_request = object.get_boolean_member("join_by_request");
            
            if (object.has_member("description"))
                description = object.get_string_member("description");
            
            if (object.has_member("invite_link"))
                invite_link = object.get_string_member("invite_link");
            
            if (object.has_member("pinned_message"))
                pinned_message = new Message(object.get_object_member("pinned_message"));
            
            if (object.has_member("permissions"))
                permissions = new ChatPermissions(object.get_object_member("permissions"));
            
            if (object.has_member("slow_mode_delay"))
                slow_mode_delay = (int) object.get_int_member("slow_mode_delay");
            
            if (object.has_member("message_auto_delete_time"))
                message_auto_delete_time = (int) object.get_int_member("message_auto_delete_time");
            
            if (object.has_member("has_aggressive_anti_spam_enabled"))
                has_aggressive_anti_spam_enabled = object.get_boolean_member("has_aggressive_anti_spam_enabled");
            
            if (object.has_member("has_hidden_members"))
                has_hidden_members = object.get_boolean_member("has_hidden_members");
            
            if (object.has_member("has_protected_content"))
                has_protected_content = object.get_boolean_member("has_protected_content");
            
            if (object.has_member("sticker_set_name"))
                sticker_set_name = object.get_string_member("sticker_set_name");
            
            if (object.has_member("can_set_sticker_set"))
                can_set_sticker_set = object.get_boolean_member("can_set_sticker_set");
            
            if (object.has_member("linked_chat_id"))
                linked_chat_id = object.get_int_member("linked_chat_id");
            
            if (object.has_member("location"))
                location = new ChatLocation(object.get_object_member("location"));
        }
        
        public enum Type {
            PRIVATE,
            GROUP,
            SUPERGROUP,
            CHANNEL;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "private":
                        return PRIVATE;
                    case "group":
                        return GROUP;
                    case "supergroup":
                        return SUPERGROUP;
                    case "channel":
                        return CHANNEL;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case PRIVATE:
                        return "private";
                    case GROUP:
                        return "group";
                    case SUPERGROUP:
                        return "supergroup";
                    case CHANNEL:
                        return "channel";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
