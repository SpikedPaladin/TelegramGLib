namespace Telegram {
    
    public class SetStickerEmojiList : BaseRequest {
        public string sticker;
        public string[] emoji_list;
        
        public override string method() {
            return "setStickerEmojiList";
        }
        
        public override string queue() {
            return @"sticker=$sticker&emoji_list=$(Util.serialize_array(emoji_list))";
        }
    }
}
