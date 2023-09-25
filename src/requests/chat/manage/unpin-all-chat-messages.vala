namespace Telegram {
    
    public class UnpinAllChatMessages : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "unpinAllChatMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
