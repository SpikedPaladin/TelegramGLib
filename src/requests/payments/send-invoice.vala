namespace Telegram {
    
    public class SendInvoice : BaseRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string title;
        public string description;
        public string payload;
        public string provider_token;
        public string currency;
        public LabeledPrice[] prices;
        public int? max_tip_amount;
        public int[]? suggested_tip_amounts;
        public string? start_parameter;
        public string? provider_data;
        public string? photo_url;
        public int? photo_size;
        public int? photo_width;
        public int? photo_height;
        public bool? need_name;
        public bool? need_phone_number;
        public bool? need_email;
        public bool? need_shipping_address;
        public bool? send_phone_number_to_provider;
        public bool? send_email_to_provider;
        public bool? is_flexible;
        public bool? disable_notification;
        public bool? protect_content;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendInvoice";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&title=$title&description=$description&payload=$payload&provider_token=$provider_token&currency=$currency";
            
            Serializable[] arr = {};
            foreach (var element in prices) {
                arr += element;
            }
            queue += @"&prices=$(Serializable.array_to_string(arr))";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (max_tip_amount != null)
                queue += @"&max_tip_amount=$max_tip_amount";
            
            if (suggested_tip_amounts != null) {
                var builder = new Json.Builder();
                
                builder.begin_array();
                
                foreach (var element in suggested_tip_amounts) {
                    builder.add_int_value(element);
                }
                
                builder.end_array();
                
                queue += @"&suggested_tip_amounts=$(Json.to_string(builder.get_root(), false))";
            }
            
            if (start_parameter != null)
                queue += @"&start_parameter=$start_parameter";
            
            if (provider_data != null)
                queue += @"&provider_data=$provider_data";
            
            if (photo_url != null)
                queue += @"&photo_url=$photo_url";
            
            if (photo_size != null)
                queue += @"&photo_size=$photo_size";
            
            if (photo_width != null)
                queue += @"&photo_width=$photo_width";
            
            if (photo_height != null)
                queue += @"&photo_height=$photo_height";
            
            if (need_name != null)
                queue += @"&need_name=$need_name";
            
            if (need_phone_number != null)
                queue += @"&need_phone_number=$need_phone_number";
            
            if (need_email != null)
                queue += @"&need_email=$need_email";
            
            if (need_shipping_address != null)
                queue += @"&need_shipping_address=$need_shipping_address";
            
            if (send_phone_number_to_provider != null)
                queue += @"&send_phone_number_to_provider=$send_phone_number_to_provider";
            
            if (send_email_to_provider != null)
                queue += @"&send_email_to_provider=$send_email_to_provider";
            
            if (is_flexible != null)
                queue += @"&is_flexible=$is_flexible";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (protect_content != null)
                queue += @"&protect_content=$protect_content";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
}
