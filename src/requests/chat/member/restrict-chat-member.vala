using Telegram.Types;

namespace Telegram.Requests {
	
    public class RestrictChatMember : BaseRequest {
        public int64 chat_id;
        public int64 user_id;
        public ChatPermissions permissions;
        public bool? use_independent_chat_permissions;
        public int64? until_date;
        
        public override string method() {
            return "restrictChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id&permissions=$permissions";
            
            if (use_independent_chat_permissions != null)
                queue += @"&use_independent_chat_permissions=$use_independent_chat_permissions";
            
            if (until_date != null)
                queue += @"&until_date=$until_date";
            
            return queue;
        }
    }
}
