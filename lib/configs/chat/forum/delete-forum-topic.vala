using Telegram.Types;

namespace Telegram.Configs {
	
    public class DeleteForumTopicConfig : BaseConfig {
        public int64 chat_id;
        public int message_thread_id;
        
        public override string method() {
            return "deleteForumTopic";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_thread_id=$message_thread_id";
        }
    }
}
