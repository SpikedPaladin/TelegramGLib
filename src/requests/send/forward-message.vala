namespace Telegram {
    
    public class ForwardMessage : BaseRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public ChatId from_chat_id;
        public bool? disable_notification;
        public bool? protect_content;
        public int message_id;
        
        public override string method() {
            return "forwardMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&from_chat_id=$from_chat_id&message_id=$message_id";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            return queue;
        }
    }
}
