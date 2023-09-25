namespace Telegram {
    
    public class EditMessageText : BaseRequest {
        public ChatId? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public string text;
        public ParseMode? parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? entities;
        public bool? disable_web_page_preview;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageText";
        }
        
        public override string queue() {
            var queue = @"text=$text";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (entities != null) {
                Serializable[] arr = {};
                foreach (var entity in entities) {
                    arr += entity;
                }
                queue += @"&entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_web_page_preview != null)
                queue += @"&disable_web_page_preview=$disable_web_page_preview";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
