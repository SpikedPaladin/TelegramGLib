namespace Telegram {
    
    public class CreateChatInviteLink : BaseRequest {
        public ChatId chat_id;
        public string? name;
        public int64? expire_date;
        public int? member_limit;
        public bool? creates_join_request;
        
        public override string method() {
            return "createChatInviteLink";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (name != null)
                queue += @"&name=$name";
            
            if (expire_date != null)
                queue += @"&expire_date=$expire_date";
            
            if (member_limit != null)
                queue += @"&member_limit=$member_limit";
            
            if (creates_join_request != null)
                queue += @"&creates_join_request=$creates_join_request";
            
            return queue;
        }
    }
}
