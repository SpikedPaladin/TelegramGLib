namespace Telegram {
    
    public class SendVenue : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public double latitude;
        public double longitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVenue";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&latitude=$latitude&longitude=$longitude&title=$title&address=$address";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (foursquare_id != null)
                queue += @"&foursquare_id=$foursquare_id";
            
            if (foursquare_type != null)
                queue += @"&foursquare_type=$foursquare_type";
            
            if (google_place_id != null)
                queue += @"&google_place_id=$google_place_id";
            
            if (google_place_type != null)
                queue += @"&google_place_type=$google_place_type";
            
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
