namespace Telegram {
    
    public class RevokeChatInviteLink : AbstractRequest {
        public ChatId chat_id;
        public string invite_link;
        
        public override string method() {
            return "revokeChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&invite_link=$invite_link";
        }
    }
}
