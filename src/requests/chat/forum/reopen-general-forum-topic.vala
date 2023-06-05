namespace Telegram {
    
    public class ReopenGeneralForumTopic : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "reopenGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
