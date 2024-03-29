namespace Telegram {
    
    public class SendPoll : AbstractRequest {
        public ChatId chat_id;
        public int? message_thread_id;
        public string question;
        public string[] options;
        public bool? is_anonymous;
        public Poll.Type? type;
        public bool? allows_multiple_answers;
        public int? correct_option_id;
        public string? explanation;
        public ParseMode? explanation_parse_mode = DEFAULT_PARSE_MODE;
        public MessageEntity[]? explanation_entities;
        public int? open_period;
        public int64? close_date;
        public bool? is_closed;
        public bool? disable_notification;
        public bool? protect_content;
        public ReplyParameters? reply_parameters;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendPoll";
        }
        public override string queue() {
            var queue = @"chat_id=$chat_id&question=$question&options=$(Util.serialize_array(options))";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            if (is_anonymous != null)
                queue += @"&is_anonymous=$is_anonymous";
            
            if (type != null)
                queue += @"&type=$type";
            
            if (allows_multiple_answers != null)
                queue += @"&allows_multiple_answers=$allows_multiple_answers";
            
            if (correct_option_id != null)
                queue += @"&correct_option_id=$correct_option_id";
            
            if (explanation != null)
                queue += @"&explanation=$explanation";
            
            if (explanation_parse_mode != null)
                queue += @"&explanation_parse_mode=$explanation_parse_mode";
            
            if (explanation_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in explanation_entities) {
                    arr += entity;
                }
                queue += @"&explanation_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (open_period != null)
                queue += @"&open_period=$open_period";
            
            if (close_date != null)
                queue += @"&close_date=$close_date";
            
            if (is_closed != null)
                queue += @"&is_closed=$is_closed";
            
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
