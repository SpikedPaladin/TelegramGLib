namespace Telegram {
    
    public class DeleteChatStickerSet : AbstractRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "deleteChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
