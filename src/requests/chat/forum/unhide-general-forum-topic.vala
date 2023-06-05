namespace Telegram {
    
    public class UnhideGeneralForumTopic : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "unhideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
