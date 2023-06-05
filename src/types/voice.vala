namespace Telegram {
    
    public class Voice {
        public string file_id;
        public string file_unique_id;
        public int duration;
        public string? mime_type;
        public int64? file_size;
        
        public Voice(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = object.get_int_member("file_size");
        }
    }
}
