namespace Telegram {
    
    public class DeleteMessage : AbstractRequest {
        public ChatId chat_id;
        public int message_id;
        
        public override string method() {
            return "deleteMessage";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_id=$message_id";
        }
    }
}
