namespace Telegram.Types {
	
    public interface BotCommandScope : Object, Serializable {
        
        public enum Type {
            DEFAULT,
            ALL_PRIVATE_CHATS,
            ALL_GROUP_CHATS,
            ALL_CHAT_ADMINISTRATORS,
            CHAT,
            CHAT_ADMINISTRATORS,
            CHAT_MEMBER;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "default":
                        return DEFAULT;
                    case "all_private_chats":
                        return ALL_PRIVATE_CHATS;
                    case "all_group_chats":
                        return ALL_GROUP_CHATS;
                    case "all_chat_administrators":
                        return ALL_CHAT_ADMINISTRATORS;
                    case "chat":
                        return CHAT;
                    case "chat_administrators":
                        return CHAT_ADMINISTRATORS;
                    case "chat_member":
                        return CHAT_MEMBER;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case DEFAULT:
                        return "default";
                    case ALL_PRIVATE_CHATS:
                        return "all_private_chats";
                    case ALL_GROUP_CHATS:
                        return "all_group_chats";
                    case ALL_CHAT_ADMINISTRATORS:
                        return "all_chat_administrators";
                    case CHAT:
                        return "chat";
                    case CHAT_ADMINISTRATORS:
                        return "chat_administrators";
                    case CHAT_MEMBER:
                        return "chat_member";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class BotCommandScopeDefault : Object, Serializable, BotCommandScope {
        public Type type;
        
        public BotCommandScopeDefault(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeAllPrivateChats : Object, Serializable, BotCommandScope {
        public Type type;
        
        public BotCommandScopeAllPrivateChats(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeAllGroupChats : Object, Serializable, BotCommandScope {
        public Type type;
        
        public BotCommandScopeAllGroupChats(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeAllChatAdministrators : Object, Serializable, BotCommandScope {
        public Type type;
        
        public BotCommandScopeAllChatAdministrators(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeChat : Object, Serializable, BotCommandScope {
        public Type type;
        public int64? chat_id;
        public string? chat_username;
        
        public BotCommandScopeChat(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            chat_username = object.get_string_member("chat_id");
            
            if (chat_username == null)
                chat_id = object.get_int_member("chat_id");
        }
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("chat_id");
            if (chat_id != null)
                builder.add_int_value(chat_id);
            else
                builder.add_string_value(chat_username);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeChatAdministrators : Object, Serializable, BotCommandScope {
        public Type type;
        public int64? chat_id;
        public string? chat_username;
        
        public BotCommandScopeChatAdministrators(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            chat_username = object.get_string_member("chat_id");
            
            if (chat_username == null)
                chat_id = object.get_int_member("chat_id");
        }
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("chat_id");
            if (chat_id != null)
                builder.add_int_value(chat_id);
            else
                builder.add_string_value(chat_username);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class BotCommandScopeChatMember : Object, Serializable, BotCommandScope {
        public Type type;
        public int64? chat_id;
        public string? chat_username;
        public int64 user_id;
        
        public BotCommandScopeChatMember(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            chat_username = object.get_string_member("chat_id");
            
            if (chat_username == null)
                chat_id = object.get_int_member("chat_id");
            
            user_id = object.get_int_member("user_id");
        }
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("chat_id");
            if (chat_id != null)
                builder.add_int_value(chat_id);
            else
                builder.add_string_value(chat_username);
            
            builder.set_member_name("user_id");
            builder.add_int_value(user_id);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
