using Telegram.Types;

namespace Telegram.Requests {
	
    public class AnswerInlineQuery : BaseRequest {
        public string inline_query_id;
        public InlineQueryResult[] results;
        public int? cache_time;
        public bool? is_personal;
        public string? next_offset;
        public InlineQueryResultsButton? button;
        
        public override string method() {
            return "answerInlineQuery";
        }
        
        public override string queue() {
            var queue = @"inline_query_id=$inline_query_id";
            
            Serializable[] arr = {};
            foreach (var entity in results) {
                arr += entity;
            }
            queue += @"&results=$(Serializable.array_to_string(arr))";
            
            if (cache_time != null)
                queue += @"&cache_time=$cache_time";
            
            if (is_personal != null)
                queue += @"&is_personal=$is_personal";
            
            if (next_offset != null)
                queue += @"&next_offset=$next_offset";
            
            if (button != null)
                queue += @"&button=$button";
            
            return queue;
        }
    }
}
