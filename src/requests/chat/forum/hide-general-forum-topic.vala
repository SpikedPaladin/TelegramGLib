namespace Telegram {
    
    public class HideGeneralForumTopic : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "hideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
