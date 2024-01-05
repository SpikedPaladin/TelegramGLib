namespace Telegram {
    
    public class SendSticker : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string sticker;
        public string? emoji;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendSticker";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (!has_attachments())
                queue += @"&sticker=$sticker";
            
            if (emoji != null)
                queue += @"&emoji=$emoji";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (reply_parameters != null)
                queue += @"&reply_parameters=$reply_parameters";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return bytes != null || sticker.has_prefix("file://");
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (bytes != null) {
                multipart.append_form_file("sticker", sticker, "", bytes);
                
                return multipart;
            }
            
            var file = File.new_for_path(sticker.replace("file://", ""));
            var body = yield file.load_bytes_async(null, null);
            
            multipart.append_form_file("sticker", file.get_basename(), "", body);
            
            return multipart;
        }
    }
}
