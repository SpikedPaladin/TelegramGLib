namespace Telegram {
    
    public class InputMediaAnimation : Object, Serializable, InputMedia {
        public Bytes? bytes;
        public string media;
        public string? thumbnail;
        public Bytes? thumbnail_bytes;
        public string? caption;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? caption_entities;
        public int? width;
        public int? height;
        public int? duration;
        public bool? has_spoiler;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("animation");
            
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
            
            if (width != null) {
                builder.set_member_name("width");
                builder.add_int_value(width);
            }
            
            if (height != null) {
                builder.set_member_name("height");
                builder.add_int_value(height);
            }
            
            if (duration != null) {
                builder.set_member_name("duration");
                builder.add_int_value(duration);
            }
            
            if (has_spoiler != null) {
                builder.set_member_name("has_spoiler");
                builder.add_boolean_value(has_spoiler);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            return bytes != null || thumbnail_bytes != null || media.has_prefix("file://") || (thumbnail != null && thumbnail.has_prefix("file://"));
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            
            if (bytes != null) {
                arr += InputFile() {
                    name = @"media$index",
                    filename = media,
                    body = bytes
                };
                media = @"attach://media$index";
            }
            
            if (thumbnail_bytes != null) {
                arr += InputFile() {
                    name = @"thumbnail$index",
                    filename = media,
                    body = bytes
                };
                thumbnail = @"attach://thumbnail$index";
            }
            
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
