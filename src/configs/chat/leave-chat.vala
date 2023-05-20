using Telegram.Types;

namespace Telegram.Configs {
	
    public class LeaveChatConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "leaveChat";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
