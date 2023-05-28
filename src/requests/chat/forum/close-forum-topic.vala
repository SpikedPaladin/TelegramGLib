using Telegram.Types;

namespace Telegram.Requests {
	
    public class CloseForumTopic : BaseRequest {
        public int64 chat_id;
        public int message_thread_id;
        
        public override string method() {
            return "closeForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_thread_id=$message_thread_id";
        }
    }
}