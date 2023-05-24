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
}
