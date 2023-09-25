namespace Telegram {
    
    public class SetStickerKeywords : AbstractRequest {
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
