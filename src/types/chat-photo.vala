namespace Telegram {
    
    public class ChatPhoto {
        public string small_file_id;
        public string small_file_unique_id;
        public string big_file_id;
        public string big_file_unique_id;
        
        public ChatPhoto(Json.Object object) {
            small_file_id = object.get_string_member("small_file_id");
            small_file_unique_id = object.get_string_member("small_file_unique_id");
            big_file_id = object.get_string_member("big_file_id");
            big_file_unique_id = object.get_string_member("big_file_unique_id");
        }
    }
}
