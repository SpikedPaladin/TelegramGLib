namespace Telegram {
    
    public class UserShared {
        public int? request_id;
        public int64? user_id;
        
        public UserShared(Json.Object object) {
            request_id = (int) object.get_int_member("request_id");
            user_id = object.get_int_member("user_id");
        }
    }
}
