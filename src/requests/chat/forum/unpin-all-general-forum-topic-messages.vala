namespace Telegram {
    
    public class UnpinAllGeneralForumTopicMessages : BaseRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "unpinAllGeneralForumTopicMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
