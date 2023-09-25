namespace Telegram {
    
    public class CloseGeneralForumTopic : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "closeGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
