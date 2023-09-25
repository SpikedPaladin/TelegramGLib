namespace Telegram {
    
    public class ExportChatInviteLink : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "exportChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
