namespace Telegram {
    
    public class HideGeneralForumTopic : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "hideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
