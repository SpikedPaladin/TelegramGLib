namespace Telegram {
    
    public class SendContact : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendContact";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&phone_number=$phone_number&first_name=$first_name";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (last_name != null)
                queue += @"&last_name=$last_name";
            
            if (vcard != null)
                queue += @"&vcard=$vcard";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (reply_parameters != null)
                queue += @"&reply_parameters=$reply_parameters";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
