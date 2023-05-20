using Telegram.Types;

namespace Telegram.Configs {
	
    public class HideGeneralForumTopicConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "hideGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
