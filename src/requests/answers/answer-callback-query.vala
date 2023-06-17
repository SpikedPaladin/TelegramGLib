namespace Telegram {
    
    public class AnswerCallbackQuery : BaseRequest {
        public string callback_query_id;
        public string? text;
        public bool? show_alert;
        public string? url;
        public int? cache_time;
        
        public override string method() {
            return "answerCallbackQuery";
        }
        
        public override string queue() {
            var queue = @"callback_query_id=$callback_query_id";
            if (text != null)
                queue += @"&text=$text";
            
            if (show_alert != null)
                queue += @"&show_alert=$show_alert";
            
            if (url != null)
                queue += @"&url=$url";
            
            if (cache_time != null)
                queue += @"&cache_time=$cache_time";
            
            return queue;
        }
    }
}
