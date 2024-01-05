namespace Telegram {
    
    public class SendMessage : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string text;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? entities;
        public LinkPreviewOptions? link_preview_options;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&text=$text";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (entities != null) {
                Serializable[] arr = {};
                foreach (var entity in entities) {
                    arr += entity;
                }
                queue += @"&entities=$(Serializable.array_to_string(arr))";
            }
            
            if (link_preview_options != null)
                queue += @"&link_preview_options=$link_preview_options";
            
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
    }
}
