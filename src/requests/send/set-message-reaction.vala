namespace Telegram {
    
    public class SetMessageReaction : AbstractRequest {
        public ChatId chat_id;
        public int message_id;
        public ReactionType[]? reaction;
        public bool? is_big;
        
        public override string method() {
            return "setMessageReaction";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&message_id=$message_id";
            
            if (reaction != null) {
                Serializable[] arr = {};
                foreach (var item in reaction) {
                    arr += item;
                }
                queue += @"&message_thread_id=$(Serializable.array_to_string(arr))";
            }
            
            if (is_big != null)
                queue += @"&is_big=$is_big";
            
            return queue;
        }
    }
}