namespace Telegram {
    
    public class StickerSet {
        public string name;
        public string title;
        public Sticker.Type sticker_type;
        public bool is_animated;
        public bool is_video;
        public Sticker[] stickers;
        public PhotoSize? thumbnail;
        
        public StickerSet(Json.Object object) {
            name = object.get_string_member("name");
            title = object.get_string_member("title");
            sticker_type = Sticker.Type.parse(object.get_string_member("sticker_type"));
            is_animated = object.get_boolean_member("is_animated");
            is_video = object.get_boolean_member("is_video");
            
            Sticker[] temp = {};
            foreach (var element in object.get_array_member("stickers").get_elements()) {
                temp += new Sticker(element.get_object());
            }
            stickers = temp;
            
            if (object.has_member("thumbnail"))
                thumbnail = new PhotoSize(object.get_object_member("thumb"));
        }
    }
}
