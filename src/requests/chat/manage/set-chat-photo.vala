namespace Telegram {
    
    public class SetChatPhoto : UploadRequest {
        public ChatId chat_id;
        public string photo;
        
        public override string method() {
            return "setChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
        
        public override bool has_attachments() {
            return true;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(photo.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            multipart.append_form_file("photo", file.get_basename(), "", body);
            
            return multipart;
        }
    }
}
