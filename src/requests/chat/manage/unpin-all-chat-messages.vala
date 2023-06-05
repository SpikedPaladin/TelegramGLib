namespace Telegram {
    
    public class UnpinAllChatMessages : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "unpinAllChatMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
