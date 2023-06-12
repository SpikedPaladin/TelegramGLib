namespace Telegram {
    
    public class UnpinAllChatMessages : BaseRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "unpinAllChatMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
