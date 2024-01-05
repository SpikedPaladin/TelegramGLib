namespace Telegram {
    
    public class CopyMessage : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public ChatId from_chat_id;
        public int message_id;
        public string? caption;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "copyMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&from_chat_id=$from_chat_id&message_id=$message_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
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
