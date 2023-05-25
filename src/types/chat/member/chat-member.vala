namespace Telegram.Types {
	
    public interface ChatMember : Object {
        
        public static ChatMember from_json(Json.Object object) {
            Status status = Status.parse(object.get_string_member("status"));
            
            switch (status) {
                case Status.CREATOR:
                    return new ChatMemberOwner(object);
                case Status.ADMINISTRATOR:
                    return new ChatMemberAdministrator(object);
                case Status.RESTRICTED:
                    return new ChatMemberRestricted(object);
                case Status.LEFT:
                    return new ChatMemberLeft(object);
                case Status.KICKED:
                    return new ChatMemberBanned(object);
                default:
                    return new ChatMemberMember(object);
            }
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
}
