using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetCustomEmojiStickerSetThumbnailConfig : BaseConfig {
        public string sticker;
        public string? custom_emoji_id;
        
        public override string method() {
            return "setCustomEmojiStickerSetThumbnail";
        }
        
        public override string queue() {
            var queue = @"sticker=$sticker";
            
            if (custom_emoji_id != null)
                queue += @"&custom_emoji_id=$custom_emoji_id";
            
            return queue;
        }
    }
}
