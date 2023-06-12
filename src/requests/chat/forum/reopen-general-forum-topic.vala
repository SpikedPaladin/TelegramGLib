namespace Telegram {
    
    public class ReopenGeneralForumTopic : BaseRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "reopenGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
