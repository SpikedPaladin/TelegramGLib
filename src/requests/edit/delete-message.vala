using Telegram.Types;

namespace Telegram.Requests {
	
    public class DeleteMessage : BaseRequest {
        public int64 chat_id;
        public int message_id;
        
        public override string method() {
            return "deleteMessage";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_id=$message_id";
        }
    }
}
