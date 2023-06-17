namespace Telegram {
    
    public class VideoNote : Object {
        public string file_id;
        public string file_unique_id;
        public int length;
        public int duration;
        public PhotoSize? thumbnail;
        public int? file_size;
        
        public VideoNote(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            length = (int) object.get_int_member("length");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("thumbnail"))
                thumbnail = new PhotoSize(object.get_object_member("thumbnail"));
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
}
