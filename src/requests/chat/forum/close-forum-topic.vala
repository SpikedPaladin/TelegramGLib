namespace Telegram {
    
    public class CloseForumTopic : AbstractRequest {
        public ChatId chat_id;
        public int message_thread_id;
        
        public override string method() {
            return "closeForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_thread_id=$message_thread_id";
        }
    }
}
