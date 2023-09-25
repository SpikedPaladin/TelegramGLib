namespace Telegram {
    
    public class BanChatSenderChat : AbstractRequest {
        public ChatId chat_id;
        public int64 sender_chat_id;
        
        public override string method() {
            return "banChatSenderChat";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&sender_chat_id=$sender_chat_id";
        }
    }
}
