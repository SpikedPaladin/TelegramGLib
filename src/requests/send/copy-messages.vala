namespace Telegram {
    
    public class CopyMessages : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public ChatId from_chat_id;
        public int[] message_ids;
        public bool? disable_notification;
        public bool? protect_content;
        public bool? remove_caption;
        
        public override string method() {
            return "copyMessages";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&from_chat_id=$from_chat_id";
            
            var builder = new Json.Builder();
                
            builder.begin_array();
            
            foreach (var id in message_ids)
                builder.add_int_value(id);
            
            builder.end_array();
            
            queue += @"&message_id=$(Json.to_string(builder.get_root(), false))";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (remove_caption != null)
                queue += @"&remove_caption=$remove_caption";
            
            return queue;
        }
    }
}
