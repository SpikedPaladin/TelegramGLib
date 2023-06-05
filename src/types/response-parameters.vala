namespace Telegram {
    
    public class ResponseParameters {
        public int64? migrate_to_chat_id;
        public int? retry_after;
        
        public ResponseParameters(Json.Object object) {
            if (object.has_member("migrate_to_chat_id"))
                migrate_to_chat_id = object.get_int_member("migrate_to_chat_id");
            
            if (object.has_member("retry_after"))
                retry_after = (int) object.get_int_member("retry_after");
        }
    }
}
