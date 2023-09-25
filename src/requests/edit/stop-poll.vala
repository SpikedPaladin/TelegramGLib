namespace Telegram {
    
    public class StopPoll : AbstractRequest {
        public ChatId? chat_id;
        public int? message_id;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "stopPoll";
        }
        
        public override string queue() {
            var queue = "";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
