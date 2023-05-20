using Telegram.Types;

namespace Telegram.Configs {
	
    public class UnhideGeneralForumTopicConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "unhideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
