using Telegram.Types;

namespace Telegram.Configs {
	
    public class ExportChatInviteLink : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "exportChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
