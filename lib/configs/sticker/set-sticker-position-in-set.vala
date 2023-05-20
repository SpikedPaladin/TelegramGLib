using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetStickerPositionInSetConfig : BaseConfig {
        public string sticker;
        public int position;
        
        public override string method() {
            return "setStickerPositionInSet";
        }
        
        public override string queue() {
            return @"sticker=$sticker&position=$position";
        }
    }
}
