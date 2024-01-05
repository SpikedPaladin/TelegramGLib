namespace Telegram {
    
    public class AddStickerToSet : UploadRequest {
        public int64 user_id;
        public string name;
        public InputSticker sticker;
        
        public override string method() {
            return "addStickerToSet";
        }
        
        public override string queue() {
            return @"user_id=$user_id&name=$name&sticker=$sticker";
        }
        
        public override bool has_attachments() {
            return sticker.has_attachments();
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(sticker.sticker.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            multipart.append_form_file("sticker", file.get_basename(), "", body);
            
            sticker.sticker = "attach://sticker";
            return multipart;
        }
    }
}
