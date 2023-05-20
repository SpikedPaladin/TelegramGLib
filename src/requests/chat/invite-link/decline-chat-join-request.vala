using Telegram.Types;

namespace Telegram.Requests {
	
    public class DeclineChatJoinRequest : BaseRequest {
        public int64 chat_id;
        public int64 user_id;
        
        public override string method() {
            return "declineChatJoinRequest";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&user_id=$user_id";
        }
    }
}
