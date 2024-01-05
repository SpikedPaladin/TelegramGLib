namespace Telegram {
    
    public class SendLocation : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public double latitude;
        public double longitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendLocation";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&latitude=$latitude&longitude=$longitude";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (horizontal_accuracy != null)
                queue += @"&horizontal_accuracy=$horizontal_accuracy";
            
            if (live_period != null)
                queue += @"&live_period=$live_period";
            
            if (heading != null)
                queue += @"&heading=$heading";
            
            if (proximity_alert_radius != null)
                queue += @"&proximity_alert_radius=$proximity_alert_radius";
            
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
