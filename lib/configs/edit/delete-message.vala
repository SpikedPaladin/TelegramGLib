using Telegram.Types;

namespace Telegram.Configs {
	
    public class DeleteMessageConfig : BaseConfig {
        public int64 chat_id;
        public int message_id;
        
        public override string method() {
            return "deleteMessage";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_id=$message_id";
        }
    }
}
