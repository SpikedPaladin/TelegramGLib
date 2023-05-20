using Telegram.Types;

namespace Telegram.Configs {
	
    public class PromoteChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public bool? is_anonymous;
        public bool? can_manage_chat;
        public bool? can_post_messages;
        public bool? can_edit_messages;
        public bool? can_delete_messages;
        public bool? can_manage_video_chats;
        public bool? can_restrict_members;
        public bool? can_promote_members;
        public bool? can_change_info;
        public bool? can_invite_users;
        public bool? can_pin_messages;
        public bool? can_manage_topics;
        
        public override string method() {
            return "promoteChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (is_anonymous != null)
                queue += @"&is_anonymous=$is_anonymous";
            
            if (can_manage_chat != null)
                queue += @"&can_manage_chat=$can_manage_chat";
            
            if (can_post_messages != null)
                queue += @"&can_post_messages=$can_post_messages";
            
            if (can_edit_messages != null)
                queue += @"&can_edit_messages=$can_edit_messages";
            
            if (can_delete_messages != null)
                queue += @"&can_delete_messages=$can_delete_messages";
            
            if (can_manage_video_chats != null)
                queue += @"&can_manage_video_chats=$can_manage_video_chats";
            
            if (can_restrict_members != null)
                queue += @"&can_restrict_members=$can_restrict_members";
            
            if (can_promote_members != null)
                queue += @"&can_promote_members=$can_promote_members";
            
            if (can_change_info != null)
                queue += @"&can_change_info=$can_change_info";
            
            if (can_invite_users != null)
                queue += @"&can_invite_users=$can_invite_users";
            
            if (can_pin_messages != null)
                queue += @"&can_pin_messages=$can_pin_messages";
            
            if (can_manage_topics != null)
                queue += @"&can_manage_topics=$can_manage_topics";
            
            return queue;
        }
    }
}
