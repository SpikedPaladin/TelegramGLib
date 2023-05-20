using Telegram.Types;

namespace Telegram.Configs {
	
    public class CreateNewStickerSetConfig : UploadConfig {
        public int64 user_id;
        public string name;
        public string title;
        public InputSticker[] stickers;
        public Sticker.Format sticker_format;
        public Sticker.Type? sticker_type;
        public bool? needs_repainting;
        
        public override string method() {
            return "sendMediaGroup";
        }
        
        public override string queue() {
            var queue = @"user_id=$user_id&name=$name&title=$title&sticker_format=$sticker_format";
            
            Serializable[] arr = {};
            foreach (var entity in stickers) {
                arr += entity;
            }
            queue += @"&stickers=$(Serializable.array_to_string(arr))";
            
            if (sticker_type != null)
                queue += @"&sticker_type=$sticker_type";
            
            if (needs_repainting != null)
                queue += @"&needs_repainting=$needs_repainting";
            
            return queue;
        }
        
        public override bool has_attachments() {
            foreach (var element in stickers) {
                
                if (element.has_attachments())
                    return true;
            }
            
            return false;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            for (int i = 0; i < stickers.length; i++) {
                var arr = yield stickers[i].append(i);
                
                foreach (var file in arr) {
                    multipart.append_form_file(file.name, file.filename, "", file.body);
                }
            }
            
            return multipart;
        }
    }
}
