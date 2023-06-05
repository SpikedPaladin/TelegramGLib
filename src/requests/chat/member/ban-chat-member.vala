namespace Telegram {
    
    public class BanChatMember : BaseRequest {
        public int64 chat_id;
        public int64 user_id;
        public int64? until_date;
        public bool? revoke_messages;
        
        public override string method() {
            return "banChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (until_date != null)
                queue += @"&until_date=$until_date";
            
            if (revoke_messages != null)
                queue += @"&revoke_messages=$revoke_messages";
            
            return queue;
        }
    }
}
