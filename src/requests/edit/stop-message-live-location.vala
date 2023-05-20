using Telegram.Types;

namespace Telegram.Requests {
	
    public class StopMessageLiveLocation : BaseRequest {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "stopMessageLiveLocation";
        }
        
        public override string queue() {
            var queue = "";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
