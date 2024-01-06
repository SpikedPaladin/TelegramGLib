namespace Telegram {
    
    public interface ReactionType : Object, Serializable {
        
        public static ReactionType? from_json(Json.Object object) {
            var type = Type.parse(object.get_string_member("type"));
            
            switch (type) {
                case Type.EMOJI:
                    return new ReactionTypeEmoji(object);
                case Type.CUSTOM_EMOJI:
                    return new ReactionTypeCustomEmoji(object);
                default:
                    return null;
            }
        }
        
        public enum Type {
            EMOJI,
            CUSTOM_EMOJI;
            
            public static Type? parse(string status) {
                switch (status) {
                    case "emoji":
                        return EMOJI;
                    case "custom_emoji":
                        return CUSTOM_EMOJI;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case EMOJI:
                        return "emoji";
                    default:
                        return "custom_emoji";
                }
            }
        }
    }
}