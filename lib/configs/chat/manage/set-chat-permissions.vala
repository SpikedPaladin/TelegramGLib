using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetChatPermissionsConfig : BaseConfig {
        public int64 chat_id;
        public ChatPermissions permissions;
        public bool? use_independent_chat_permissions;
        
        public override string method() {
            return "setChatPermissions";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&permissions=$permissions";
            
            if (use_independent_chat_permissions != null)
                queue += @"&use_independent_chat_permissions=$use_independent_chat_permissions";
            
            return queue;
        }
    }
}
