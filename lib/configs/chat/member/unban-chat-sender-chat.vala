using Telegram.Types;

namespace Telegram.Configs {
	
    public class UnbanChatSenderChatConfig : BaseConfig {
        public int64 chat_id;
        public int64 sender_chat_id;
        
        public override string method() {
            return "unbanChatSenderChat";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&sender_chat_id=$sender_chat_id";
        }
    }
}
