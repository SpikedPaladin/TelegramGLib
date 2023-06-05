namespace Telegram {
    
    public class InputMediaPhoto : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? has_spoiler;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("photo");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
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
            
            if (has_spoiler != null) {
                builder.set_member_name("has_spoiler");
                builder.add_boolean_value(has_spoiler);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            return media.has_prefix("file://");
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            
            var file = File.new_for_path(media.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            arr += InputFile() {
                name = @"media$index",
                filename = file.get_basename(),
                body = body
            };
            media = @"attach://media$index";
            
            return arr;
        }
    }
}
