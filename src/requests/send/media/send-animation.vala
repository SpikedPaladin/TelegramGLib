namespace Telegram {
    
    public class SendAnimation : UploadRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string animation;
        public int? duration;
        public int? width;
        public int? height;
        public string? thumbnail;
        public Bytes? thumbnail_bytes;
        public string? caption;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? caption_entities;
        public bool? has_spoiler;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendAnimation";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (!animation.has_prefix("file://") && bytes == null)
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
            
            if (reply_parameters != null)
                queue += @"&reply_parameters=$reply_parameters";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return bytes != null || thumbnail_bytes != null || animation.has_prefix("file://") || (thumbnail != null && thumbnail.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (bytes != null)
                multipart.append_form_file("animation", animation, "", bytes);
            
            if (animation.has_prefix("file://")) {
                var file = File.new_for_path(animation.replace("file://", ""));
                var body = yield file.load_bytes_async(null, null);
                
                multipart.append_form_file("animation", file.get_basename(), "", body);
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
