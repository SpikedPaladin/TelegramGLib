namespace Telegram {
    
    public class AnswerPreCheckoutQuery : AbstractRequest {
        public string pre_checkout_query_id;
        public bool ok;
        public string? error_message;
        
        public override string method() {
            return "answerPreCheckoutQuery";
        }
        
        public override string queue() {
            var queue = @"pre_checkout_query_id=$pre_checkout_query_id&ok=$ok";
            
            if (error_message != null)
                queue += @"&error_message=$error_message";
            
            return queue;
        }
    }
}
