using Telegram.Types;

namespace Telegram.Configs {
	
    public class ReopenGeneralForumTopicConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "reopenGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
