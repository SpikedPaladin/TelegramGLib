namespace Telegram {
    
    public class UnhideGeneralForumTopic : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "unhideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
