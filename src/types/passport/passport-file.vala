namespace Telegram {
    
    public class PassportFile : Object {
        public string file_id;
        public string file_unique_id;
        public int file_size;
        public int64 file_date;
        
        public PassportFile(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            file_size = (int) object.get_int_member("file_size");
            file_date = object.get_int_member("file_date");
        }
    }
}
