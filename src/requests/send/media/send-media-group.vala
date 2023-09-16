namespace Telegram {
    
    public class SendMediaGroup : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public InputMediaGroupable[] media;
        public bool? disable_notification;
        public bool? protect_content;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        
        public override string method() {
            return "sendMediaGroup";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (media != null) {
                Serializable[] arr = {};
                foreach (var entity in media) {
                    arr += entity;
                }
                queue += @"&media=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            return queue;
        }
        
        public override bool has_attachments() {
            foreach (var element in media) {
                
                if (element.has_attachments())
                    return true;
            }
            
            return false;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            for (int i = 0; i < media.length; i++) {
                if (!media[i].has_attachments())
                    continue;
                
                foreach (var file in yield media[i].append(i)) {
                    multipart.append_form_file(file.name, file.filename, "", file.body);
                }
            }
            
            return multipart;
        }
    }
}
