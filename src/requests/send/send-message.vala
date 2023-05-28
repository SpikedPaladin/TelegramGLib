using Telegram.Types;

namespace Telegram.Requests {
	
    public class SendMessage : BaseRequest {
        public int64 chat_id;
        public int? message_thread_id;
        public string text;
        public ParseMode? parse_mode;
        public MessageEntity[]? entities;
        public bool? disable_web_page_preview;
        public bool? disable_notification;
        public bool? protect_content;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
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
            
            if (disable_web_page_preview != null)
                queue += @"&disable_web_page_preview=$disable_web_page_preview";
            
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
    }
}