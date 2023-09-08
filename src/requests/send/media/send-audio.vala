namespace Telegram {
    
    public class SendAudio : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string audio;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? duration;
        public string? performer;
        public string? title;
        public string? thumbnail;
        public Bytes? thumbnail_bytes;
        public bool? disable_notification;
        public bool? protect_content;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendAudio";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (!audio.has_prefix("file://") || bytes != null)
                queue += @"&audio=$audio";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (performer != null)
                queue += @"&performer=$performer";
            
            if (title != null)
                queue += @"&title=$title";
            
            if (thumbnail != null)
                queue += @"&thumbnail=$thumbnail";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return bytes != null || thumbnail_bytes != null || audio.has_prefix("file://") || (thumbnail != null && thumbnail.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (bytes != null)
                multipart.append_form_file("audio", audio, "", bytes);
            
            if (audio.has_prefix("file://")) {
                var file = File.new_for_path(audio.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                multipart.append_form_file("audio", file.get_basename(), "", body);
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
