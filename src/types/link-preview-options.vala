namespace Telegram {
    
    public class LinkPreviewOptions : Serializable, Object {
        public bool? is_disabled;
        public string? url;
        public bool? prefer_small_media;
        public bool? prefer_large_media;
        public bool? show_above_text;
        
        public LinkPreviewOptions(Json.Object? object = null) {
            if (object != null) {
                if (object.has_member("is_disabled"))
                    is_disabled = object.get_boolean_member("is_disabled");
                
                if (object.has_member("url"))
                    url = object.get_string_member("url");
                
                if (object.has_member("prefer_small_media"))
                    prefer_small_media = object.get_boolean_member("prefer_small_media");
                
                if (object.has_member("prefer_large_media"))
                    prefer_large_media = object.get_boolean_member("prefer_large_media");
                
                if (object.has_member("show_above_text"))
                    show_above_text = object.get_boolean_member("show_above_text");
            }
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            if (is_disabled != null) {
                builder.set_member_name("is_disabled");
                builder.add_boolean_value(is_disabled);
            }
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (prefer_small_media != null) {
                builder.set_member_name("prefer_small_media");
                builder.add_boolean_value(prefer_small_media);
            }
            
            if (prefer_large_media != null) {
                builder.set_member_name("prefer_large_media");
                builder.add_boolean_value(prefer_large_media);
            }
            
            if (show_above_text != null) {
                builder.set_member_name("show_above_text");
                builder.add_boolean_value(show_above_text);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}