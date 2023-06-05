namespace Telegram {
    
    public class SetStickerPositionInSet : BaseRequest {
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
