using Telegram.Types;

namespace Telegram.Configs {
	
    public class ApproveChatJoinRequest : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        
        public override string method() {
            return "approveChatJoinRequest";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&user_id=$user_id";
        }
    }
}
