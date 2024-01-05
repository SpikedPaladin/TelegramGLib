namespace Telegram {
    
    public class SendVideoNote : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string video_note;
        public int? duration;
        public int? length;
        public string? thumbnail;
        public Bytes? thumbnail_bytes;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVideoNote";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (!video_note.has_prefix("file://"))
                queue += @"&video_note=$video_note";
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (length != null)
                queue += @"&length=$length";
            
            if (thumbnail != null)
                queue += @"&thumbnail=$thumbnail";
            
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
            return bytes != null || thumbnail_bytes != null || video_note.has_prefix("file://") || (thumbnail != null && thumbnail.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (bytes != null)
                multipart.append_form_file("video_note", video_note, "", bytes);
            
            if (video_note.has_prefix("file://")) {
                var file = File.new_for_path(video_note.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                multipart.append_form_file("video_note", file.get_basename(), "", body);
            }
            
            if (thumbnail_bytes != null) {
                multipart.append_form_file("thumbnail", thumbnail, "", thumbnail_bytes);
                
                thumbnail = "attach://thumbnail";
            }
            
            if (thumbnail != null && thumbnail.has_prefix("file://")) {
                var file = File.new_for_path(thumbnail.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                multipart.append_form_file("thumbnail", file.get_basename(), "", body);
                thumbnail = "attach://thumbnail";
            }
            
            return multipart;
        }
    }
}
