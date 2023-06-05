namespace Telegram {
    
    public class InputMediaDocument : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? thumbnail;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_content_type_detection;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("document");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (thumbnail != null) {
                builder.set_member_name("thumbnail");
                builder.add_string_value(thumbnail);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (disable_content_type_detection != null) {
                builder.set_member_name("disable_content_type_detection");
                builder.add_boolean_value(disable_content_type_detection);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (media.has_prefix("file://"))
                return true;
            
            if (thumbnail != null && thumbnail.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (media.has_prefix("file://")) {
                var file = File.new_for_path(media.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                arr += InputFile() {
                    name = @"media$index",
                    filename = file.get_basename(),
                    body = body
                };
                media = @"attach://media$index";
            }
            
            if (thumbnail != null && thumbnail.has_prefix("file://")) {
                var file = File.new_for_path(thumbnail.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                arr += InputFile() {
                    name = @"thumbnail$index",
                    filename = file.get_basename(),
                    body = body
                };
                thumbnail = @"attach://thumbnail$index";
            }
            
            return arr;
        }
    }
}
