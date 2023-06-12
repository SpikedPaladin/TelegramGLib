namespace Telegram {
    
    public class HideGeneralForumTopic : BaseRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "hideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
