namespace Telegram.Types {
	
    public class PhotoSize {
        public string file_id;
        public string file_unique_id;
        public int width;
        public int height;
        public int? file_size;
        
        public PhotoSize(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
}
