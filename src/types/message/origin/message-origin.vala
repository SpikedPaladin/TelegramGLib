namespace Telegram {
    
    public abstract class MessageOrigin : Object {
        public int64 date;
        
        public static MessageOrigin? from_json(Json.Object object) {
            var status = Type.parse(object.get_string_member("type"));
            
            switch (status) {
                case Type.USER:
                    return new MessageOriginUser(object);
                case Type.HIDDEN_USER:
                    return new MessageOriginHiddenUser(object);
                case Type.CHAT:
                    return new MessageOriginChat(object);
                case Type.CHANNEL:
                    return new MessageOriginChannel(object);
                default:
                    return null;
            }
        }
        
        public enum Type {
            USER,
            HIDDEN_USER,
            CHAT,
            CHANNEL;
            
            public static Type? parse(string status) {
                switch (status) {
                    case "user":
                        return USER;
                    case "hidden_user":
                        return HIDDEN_USER;
                    case "chat":
                        return CHAT;
                    case "channel":
                        return CHANNEL;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case USER:
                        return "user";
                    case HIDDEN_USER:
                        return "hidden_user";
                    case CHAT:
                        return "chat";
                    default:
                        return "channel";
                }
            }
        }
    }
}