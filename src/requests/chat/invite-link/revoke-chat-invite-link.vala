using Telegram.Types;

namespace Telegram.Requests {
	
    public class RevokeChatInviteLink : BaseRequest {
        public int64 chat_id;
        public string invite_link;
        
        public override string method() {
            return "revokeChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&invite_link=$invite_link";
        }
    }
}
