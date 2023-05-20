using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetStickerKeywordsConfig : BaseConfig {
        public string sticker;
        public string[] keywords;
        
        public override string method() {
            return "setStickerKeywords";
        }
        
        public override string queue() {
            return @"sticker=$sticker&keywords=$(Util.serialize_array(keywords))";
        }
    }
}
