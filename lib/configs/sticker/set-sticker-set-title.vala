using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetStickerTitleConfig : BaseConfig {
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
