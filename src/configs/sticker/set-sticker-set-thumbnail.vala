using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetStickerSetThumbnailConfig : UploadConfig {
        public string name;
        public int64 user_id;
        public string thumbnail;
        
        public override string method() {
            return "setStickerSetThumbnail";
        }
        
        public override string queue() {
            var queue = @"name=$name&user_id=$user_id";
            
            if (!has_attachments())
                queue += @"&thumbnail=$thumbnail";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return thumbnail.has_prefix("file://");
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(thumbnail.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            multipart.append_form_file("thumbnail", file.get_basename(), "", body);
            
            return multipart;
        }
    }
}
