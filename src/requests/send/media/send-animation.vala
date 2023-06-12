namespace Telegram {
    
    public class SendAnimation : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string animation;
        public int? duration;
        public int? width;
        public int? height;
        public string? thumbnail;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? has_spoiler;
        public bool? disable_notification;
        public bool? protect_content;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendAnimation";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (!animation.has_prefix("file://"))
                queue += @"&animation=$animation";
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (width != null)
                queue += @"&width=$width";
            
            if (height != null)
                queue += @"&height=$height";
            
            if (thumbnail != null)
                queue += @"&thumbnail=$thumbnail";
            
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
            
            if (has_spoiler != null)
                queue += @"&has_spoiler=$has_spoiler";
            
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
            return animation.has_prefix("file://") || (thumbnail != null && thumbnail.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (animation.has_prefix("file://")) {
                var file = File.new_for_path(animation.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                multipart.append_form_file("animation", file.get_basename(), "", body);
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
