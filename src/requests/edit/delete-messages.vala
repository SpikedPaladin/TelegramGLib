namespace Telegram {
    
    public class DeleteMessages : AbstractRequest {
        public ChatId chat_id;
        public int[] message_ids;
        
        public override string method() {
            return "deleteMessages";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            var builder = new Json.Builder();
                
            builder.begin_array();
            
            foreach (var id in message_ids)
                builder.add_int_value(id);
            
            builder.end_array();
            
            queue += @"&message_id=$(Json.to_string(builder.get_root(), false))";
            return queue;
        }
    }
}
