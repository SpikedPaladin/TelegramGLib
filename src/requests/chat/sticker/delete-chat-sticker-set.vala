namespace Telegram {
    
    public class DeleteChatStickerSet : BaseRequest {
        public int64 chat_id;
        
        public override string method() {
            return "deleteChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
