using Telegram.Types;

namespace Telegram.Configs {
	
    public class DeleteStickerSetConfig : BaseConfig {
        public string name;
        
        public override string method() {
            return "deleteStickerSet";
        }
        
        public override string queue() {
            return @"name=$name";
        }
    }
}
