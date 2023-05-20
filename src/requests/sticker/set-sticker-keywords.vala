using Telegram.Types;

namespace Telegram.Requests {
	
    public class SetStickerKeywords : BaseRequest {
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
