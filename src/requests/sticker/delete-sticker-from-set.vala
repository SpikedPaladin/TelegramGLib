namespace Telegram {
    
    public class DeleteStickerFromSet : AbstractRequest {
        public string sticker;
        
        public override string method() {
            return "deleteStickerFromSet";
        }
        
        public override string queue() {
            return @"sticker=$sticker";
        }
    }
}
