using Telegram.Types;

namespace Telegram.Requests {
	
    public class DeleteStickerFromSet : BaseRequest {
        public string sticker;
        
        public override string method() {
            return "deleteStickerFromSet";
        }
        
        public override string queue() {
            return @"sticker=$sticker";
        }
    }
}
