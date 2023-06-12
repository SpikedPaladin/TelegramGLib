namespace Telegram {
    
    public class EditGeneralForumTopic : BaseRequest {
        public ChatId chat_id;
        public string name;
        
        public override string method() {
            return "editGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&name=$name";
        }
    }
}
