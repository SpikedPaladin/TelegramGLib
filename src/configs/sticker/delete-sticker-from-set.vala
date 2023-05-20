using Telegram.Types;

namespace Telegram.Configs {
	
    public class DeleteStickerFromSetConfig : BaseConfig {
        public string sticker;
        
        public override string method() {
            return "deleteStickerFromSet";
        }
        
        public override string queue() {
            return @"sticker=$sticker";
        }
    }
}
