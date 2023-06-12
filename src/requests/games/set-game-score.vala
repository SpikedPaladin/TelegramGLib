namespace Telegram {
    
    public class SetGameScore : BaseRequest {
        public int64 user_id;
        public int64 score;
        public bool? force;
        public bool? disable_edit_message;
        public ChatId? chat_id;
        public int? message_id;
        public string? inline_message_id;
        
        public override string method() {
            return "setGameScore";
        }
        
        public override string queue() {
            var queue = @"user_id=$user_id&score=$score";
            
            if (force != null)
                queue += @"&force=$force";
            
            if (disable_edit_message != null)
                queue += @"&disable_edit_message=$disable_edit_message";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            return queue;
        }
    }
}
