using Telegram.Types;

namespace Telegram.Configs {
	
    public class UnpinAllChatMessagesConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "unpinAllChatMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
