namespace Telegram {
    
    public class EditMessageMedia : UploadRequest {
        public ChatId? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public InputMedia media;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageMedia";
        }
        
        public override string queue() {
            var queue = @"media=$media";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            if (media.has_attachments())
                return true;
            
            return false;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            foreach (var file in yield media.append(1)) {
                multipart.append_form_file(file.name, file.filename, "", file.body);
            }
            
            return multipart;
        }
    }
}
