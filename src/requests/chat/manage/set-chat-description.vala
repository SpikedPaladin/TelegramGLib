namespace Telegram {
    
    public class SetChatDescription : AbstractRequest {
        public ChatId chat_id;
        public string? description;
        
        public override string method() {
            return "setChatDescription";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (description != null)
                queue += @"&description=$description";
            
            return queue;
        }
    }
}
