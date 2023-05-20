using Telegram.Types;

namespace Telegram.Requests {
	
    public class EditMessageCaption : BaseRequest {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageCaption";
        }
        
        public override string queue() {
            var queue = "";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
