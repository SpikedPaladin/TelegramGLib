using Telegram.Types;

namespace Telegram.Requests {
	
    public class AnswerShippingQuery : BaseRequest {
        public string shipping_query_id;
        public bool ok;
        public ShippingOption[]? shipping_options;
        public string? error_message;
        
        public override string method() {
            return "answerShippingQuery";
        }
        
        public override string queue() {
            var queue = @"shipping_query_id=$shipping_query_id&ok=$ok";
            
            if (shipping_options != null) {
                Serializable[] arr = {};
                foreach (var entity in shipping_options) {
                    arr += entity;
                }
                queue += @"&shipping_options=$(Serializable.array_to_string(arr))";
            }
            
            if (error_message != null)
                queue += @"&error_message=$error_message";
            
            return queue;
        }
    }
}
