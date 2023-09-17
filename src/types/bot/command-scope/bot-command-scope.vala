namespace Telegram {
    
    /**
     * This object represents the scope to which bot commands are applied.  
     * Currently, the following 7 scopes are supported:
     * * {@link BotCommandScopeDefault}
     * * BotCommandScopeAllPrivateChats
     * * BotCommandScopeAllGroupChats
     * * BotCommandScopeAllChatAdministrators
     * * BotCommandScopeChat
     * * BotCommandScopeChatAdministrators
     * * BotCommandScopeChatMember
     *
     * ## Determining list of commands  
     * The following algorithm is used to determine the list of commands for a particular user viewing the bot menu. The first list of commands which is set is returned:
     * 
     * **Commands in the chat with the bot**
     * * botCommandScopeChat + language_code
     * * botCommandScopeChat
     * * botCommandScopeAllPrivateChats + language_code
     * * botCommandScopeAllPrivateChats
     * * botCommandScopeDefault + language_code
     * * botCommandScopeDefault
     * 
     * **Commands in group and supergroup chats**
     * * botCommandScopeChatMember + language_code
     * * botCommandScopeChatMember
     * * botCommandScopeChatAdministrators + language_code (administrators only)
     * * botCommandScopeChatAdministrators (administrators only)
     * * botCommandScopeChat + language_code
     * * botCommandScopeChat
     * * botCommandScopeAllChatAdministrators + language_code (administrators only)
     * * botCommandScopeAllChatAdministrators (administrators only)
     * * botCommandScopeAllGroupChats + language_code
     * * botCommandScopeAllGroupChats
     * * botCommandScopeDefault + language_code
     * * botCommandScopeDefault
     */
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
