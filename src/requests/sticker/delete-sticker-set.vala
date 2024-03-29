namespace Telegram {
    
    public class DeleteStickerSet : AbstractRequest {
        public string name;
        
        public override string method() {
            return "deleteStickerSet";
        }
        
        public override string queue() {
            return @"name=$name";
        }
    }
}
