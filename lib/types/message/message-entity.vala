namespace Telegram.Types {
    
    public class MessageEntity : Object, Serializable {
        public Type type;
        public int offset;
        public int length;
        public string? url;
        public User? user;
        public string? language;
        public string? custom_emoji_id;
        
        public MessageEntity(Json.Object? object = null) {
            if (object != null) {
                type = Type.parse(object.get_string_member("type"));
                offset = (int) object.get_int_member("offset");
                length = (int) object.get_int_member("length");
                
                if (object.has_member("url"))
                    url = object.get_string_member("url");
                
                if (object.has_member("user"))
                    user = new User(object.get_object_member("user"));
                
                if (object.has_member("language"))
                    language = object.get_string_member("language");
                
                if (object.has_member("custom_emoji_id"))
                    custom_emoji_id = object.get_string_member("custom_emoji_id");
            }
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("offset");
            builder.add_int_value(offset);
            
            builder.set_member_name("length");
            builder.add_int_value(length);
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (user != null) {
                builder.set_member_name("user");
                builder.add_value(user.serialize());
            }
            
            if (language != null) {
                builder.set_member_name("language");
                builder.add_string_value(language);
            }
            
            if (custom_emoji_id != null) {
                builder.set_member_name("custom_emoji_id");
                builder.add_string_value(custom_emoji_id);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public enum Type {
            MENTION,
            HASHTAG,
            CASHTAG,
            BOT_COMMAND,
            URL,
            EMAIL,
            PHONE_NUMBER,
            BOLD,
            ITALIC,
            UNDERLINE,
            STRIKETHROUGH,
            SPOILER,
            CODE,
            PRE,
            TEXT_LINK,
            TEXT_MENTION,
            CUSTOM_EMOJI;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "mention":
                        return MENTION;
                    case "hashtag":
                        return HASHTAG;
                    case "cashtag":
                        return CASHTAG;
                    case "bot_command":
                        return BOT_COMMAND;
                    case "url":
                        return URL;
                    case "email":
                        return EMAIL;
                    case "phone_number":
                        return PHONE_NUMBER;
                    case "bold":
                        return BOLD;
                    case "italic":
                        return ITALIC;
                    case "underline":
                        return UNDERLINE;
                    case "strikethrough":
                        return STRIKETHROUGH;
                    case "spoiler":
                        return SPOILER;
                    case "code":
                        return CODE;
                    case "pre":
                        return PRE;
                    case "text_link":
                        return TEXT_LINK;
                    case "text_mention":
                        return TEXT_MENTION;
                    case "custom_emoji":
                        return CUSTOM_EMOJI;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case MENTION:
                        return "mention";
                    case HASHTAG:
                        return "hashtag";
                    case CASHTAG:
                        return "cashtag";
                    case BOT_COMMAND:
                        return "bot_command";
                    case URL:
                        return "url";
                    case EMAIL:
                        return "email";
                    case PHONE_NUMBER:
                        return "phone_number";
                    case BOLD:
                        return "bold";
                    case ITALIC:
                        return "italic";
                    case UNDERLINE:
                        return "underline";
                    case STRIKETHROUGH:
                        return "strikethrough";
                    case SPOILER:
                        return "spoiler";
                    case CODE:
                        return "code";
                    case PRE:
                        return "pre";
                    case TEXT_LINK:
                        return "text_link";
                    case TEXT_MENTION:
                        return "text_mention";
                    case CUSTOM_EMOJI:
                        return "custom_emoji";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
