namespace Telegram {
    
    public class UploadStickerFile : UploadRequest {
        public ChatId chat_id;
        public string sticker;
        public Sticker.Format sticker_format;
        
        public override string method() {
            return "uploadStickerFile";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&sticker_format=$sticker_format";
        }
        
        public override bool has_attachments() {
            return true;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(sticker.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            multipart.append_form_file("sticker", file.get_basename(), "", body);
            
            return multipart;
        }
    }
}
