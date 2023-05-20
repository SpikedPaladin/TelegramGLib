using Telegram.Types;

namespace Telegram.Configs {
	
    public class CloseGeneralForumTopicConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "closeGeneralForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
