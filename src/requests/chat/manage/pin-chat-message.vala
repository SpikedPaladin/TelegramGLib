namespace Telegram {
    
    public class PinChatMessage : BaseRequest {
        public ChatId chat_id;
        public int message_id;
        public bool? disable_notification;
        
        public override string method() {
            return "pinChatMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&message_id=$message_id";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            return queue;
        }
    }
}
