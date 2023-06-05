namespace Telegram {
    
    public class SetChatStickerSet : BaseRequest {
        public int64 chat_id;
        public string sticker_set_name;
        
        public override string method() {
            return "setChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&sticker_set_name=$sticker_set_name";
        }
    }
}
