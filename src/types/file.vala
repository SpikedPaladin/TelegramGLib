namespace Telegram {
    
    public class TelegramFile {
        public string file_id;
        public string file_unique_id;
        public int64? file_size;
        public string? file_path;
        
        public TelegramFile(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            
            if (object.has_member("file_size"))
                file_size = object.get_int_member("file_size");
            
            if (object.has_member("file_path"))
                file_path = object.get_string_member("file_path");
        }
    }
}
