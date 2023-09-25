namespace Telegram {
    
    public class LeaveChat : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "leaveChat";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
