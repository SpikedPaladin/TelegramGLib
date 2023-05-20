using Telegram.Types;

namespace Telegram.Requests {
	
    public class UnpinChatMessage : BaseRequest {
        public int64 chat_id;
        public int? message_id;
        
        public override string method() {
            return "unpinChatMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            return queue;
        }
    }
}
