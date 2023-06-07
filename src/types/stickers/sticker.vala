namespace Telegram {
    
    public class Sticker : Object {
        public string file_id;
        public string file_unique_id;
        public Type type;
        public int width;
        public int height;
        public bool is_animated;
        public PhotoSize? thumbnail;
        public string? emoji;
        public string? set_name;
        public TelegramFile? premium_animation;
        public MaskPosition? mask_position;
        public string? custom_emoji_id;
        public bool needs_repainting;
        public int? file_size;
        
        public Sticker(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            type = Type.parse(object.get_string_member("type"));
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            is_animated = object.get_boolean_member("is_animated");
            
            if (object.has_member("thumbnail"))
                thumbnail = new PhotoSize(object.get_object_member("thumbnail"));
            
            if (object.has_member("emoji"))
                emoji = object.get_string_member("emoji");
            
            if (object.has_member("set_name"))
                set_name = object.get_string_member("set_name");
            
            if (object.has_member("premium_animation"))
                premium_animation = new TelegramFile(object.get_object_member("premium_animation"));
            
            if (object.has_member("mask_position"))
                mask_position = new MaskPosition(object.get_object_member("mask_position"));
            
            if (object.has_member("custom_emoji_id"))
                custom_emoji_id = object.get_string_member("custom_emoji_id");
            
            if (object.has_member("needs_repainting"))
                needs_repainting = object.get_boolean_member("needs_repainting");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
        
        public enum Type {
            REGULAR,
            MASK,
            CUSTOM_EMOJI;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "regular":
                        return REGULAR;
                    case "mask":
                        return MASK;
                    case "custom_emoji":
                        return CUSTOM_EMOJI;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case REGULAR:
                        return "regular";
                    case MASK:
                        return "mask";
                    case CUSTOM_EMOJI:
                        return "custom_emoji";
                    default:
                        return "Undefined";
                }
            }
        }
        
        public enum Format {
            STATIC,
            ANIMATED,
            VIDEO;
            
            public static Format? parse(string type) {
                switch (type) {
                    case "static":
                        return STATIC;
                    case "animated":
                        return ANIMATED;
                    case "video":
                        return VIDEO;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case STATIC:
                        return "static";
                    case ANIMATED:
                        return "animated";
                    case VIDEO:
                        return "video";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
