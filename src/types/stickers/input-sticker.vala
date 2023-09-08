namespace Telegram {
    
    public class InputSticker : Object, Serializable, InputMedia, InputMediaGroupable {
        public string sticker;
        public string? filename;
        public Bytes? bytes;
        public string[] emoji_list;
        public MaskPosition? mask_position;
        public string[]? keywords;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("sticker");
            builder.add_string_value(sticker);
            
            builder.set_member_name("emoji_list");
            builder.begin_array();
            
            foreach (var emoji in emoji_list)
                builder.add_string_value(emoji);
            
            builder.end_array();
            
            if (mask_position != null) {
                builder.set_member_name("mask_position");
                builder.add_value(mask_position.serialize());
            }
            
            if (keywords != null) {
                builder.set_member_name("caption_entities");
                builder.begin_array();
                
                foreach (var keyword in keywords)
                    builder.add_string_value(keyword);
                
                builder.end_array();
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (bytes != null || sticker.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (has_attachments()) {
                Bytes body;
                
                if (bytes != null)
                    body = bytes;
                else {
                    var file = File.new_for_path(sticker.replace("file://", ""));
                    body = yield file.load_bytes_async(null, null);
                    filename = file.get_basename();
                }
                
                arr += InputFile() {
                    name = @"sticker$index",
                    filename = filename,
                    body = body
                };
                sticker = @"attach://sticker$index";
            }
            
            return arr;
        }
    }
}
