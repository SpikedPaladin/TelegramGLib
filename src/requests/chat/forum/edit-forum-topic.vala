using Telegram.Types;

namespace Telegram.Requests {
	
    public class EditForumTopic : BaseRequest {
        public int64 chat_id;
        public int message_thread_id;
        public string? name;
        public bool? icon_custom_emoji_id;
        
        public override string method() {
            return "editForumTopic";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&message_thread_id=$message_thread_id";
            
            if (name != null)
                queue += @"&name=$name";
            
            if (icon_custom_emoji_id != null)
                queue += @"&icon_custom_emoji_id=$icon_custom_emoji_id";
            
            return queue;
        }
    }
}
