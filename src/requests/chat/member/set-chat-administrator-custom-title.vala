namespace Telegram {
    
    public class SetChatAdministratorCustomTitle : AbstractRequest {
        public ChatId chat_id;
        public int64 user_id;
        public string custom_title;
        
        public override string method() {
            return "setChatAdministratorCustomTitle";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&user_id=$user_id&custom_title=$custom_title";
        }
    }
}
