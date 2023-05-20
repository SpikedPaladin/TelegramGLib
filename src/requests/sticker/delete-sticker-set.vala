using Telegram.Types;

namespace Telegram.Requests {
	
    public class DeleteStickerSet : BaseRequest {
        public string name;
        
        public override string method() {
            return "deleteStickerSet";
        }
        
        public override string queue() {
            return @"name=$name";
        }
    }
}
