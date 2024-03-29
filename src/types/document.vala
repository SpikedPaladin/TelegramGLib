namespace Telegram {
    
    public class Document : Object {
        public string file_id;
        public string file_unique_id;
        public PhotoSize? thumbnail;
        public string? file_name;
        public string? mime_type;
        public int64? file_size;
        
        public Document(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            
            if (object.has_member("thumbnail"))
                thumbnail = new PhotoSize(object.get_object_member("thumbnail"));
            
            if (object.has_member("file_name"))
                file_name = object.get_string_member("file_name");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = object.get_int_member("file_size");
        }
    }
}
