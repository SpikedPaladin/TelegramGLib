using Telegram.Types;

namespace Telegram.Requests {
	
    public class SetStickerTitle : BaseRequest {
        public string sticker;
        public string title;
        
        public override string method() {
            return "setStickerTitle";
        }
        
        public override string queue() {
            return @"sticker=$sticker&title=$title";
        }
    }
}