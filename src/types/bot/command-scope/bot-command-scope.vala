namespace Telegram {
    
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
}
