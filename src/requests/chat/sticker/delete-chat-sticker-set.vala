namespace Telegram {
    
    public class DeleteChatStickerSet : BaseRequest {
        public ChatId chat_id;
        
        public override string method() {
            return "deleteChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
