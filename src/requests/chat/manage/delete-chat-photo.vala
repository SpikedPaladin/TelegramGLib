namespace Telegram {
    
    public class DeleteChatPhoto : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "deleteChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
