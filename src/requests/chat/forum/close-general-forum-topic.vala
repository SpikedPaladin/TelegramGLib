namespace Telegram {
    
    public class CloseGeneralForumTopic : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "closeGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
