namespace Telegram {
    
    public class SetChatTitle : AbstractRequest {
        public ChatId chat_id;
        public string title;
        
        public override string method() {
            return "setChatTitle";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&title=$title";
        }
    }
}
