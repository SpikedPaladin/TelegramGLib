using Telegram.Types;

namespace Telegram.Requests {
	
    public class DeleteChatPhoto : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "deleteChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
