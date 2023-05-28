using Telegram.Types;

namespace Telegram.Requests {
	
    public class UnbanChatMember : BaseRequest {
        public int64 chat_id;
        public int64 user_id;
        public bool? only_if_banned;
        
        public override string method() {
            return "unbanChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (only_if_banned != null)
                queue += @"&only_if_banned=$only_if_banned";
            
            return queue;
        }
    }
}