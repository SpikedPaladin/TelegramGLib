namespace Telegram {
    
    public class EditMessageLiveLocation : BaseRequest {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public double latitude;
        public double longitude;
        public double? horizontal_accuracy;
        public int? heading;
        public int? proximity_alert_radius;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "editMessageLiveLocation";
        }
        
        public override string queue() {
            var queue = @"latitude=$latitude&longitude=$longitude";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (horizontal_accuracy != null)
                queue += @"&horizontal_accuracy=$horizontal_accuracy";
            
            if (heading != null)
                queue += @"&heading=$heading";
            
            if (proximity_alert_radius != null)
                queue += @"&proximity_alert_radius=$proximity_alert_radius";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
