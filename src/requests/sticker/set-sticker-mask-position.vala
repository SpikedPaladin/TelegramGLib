namespace Telegram {
    
    public class SetStickerMaskPosition : AbstractRequest {
        public string sticker;
        public MaskPosition? mask_position;
        
        public override string method() {
            return "setStickerMaskPosition";
        }
        
        public override string queue() {
            var queue = @"sticker=$sticker";
            
            if (mask_position != null)
                queue += @"&mask_position=$mask_position";
            
            return queue;
        }
    }
}
