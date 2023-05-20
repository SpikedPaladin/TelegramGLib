using Telegram.Types;

namespace Telegram.Requests {
	
    public class ExportChatInviteLink : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "exportChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
