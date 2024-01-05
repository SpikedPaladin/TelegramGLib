namespace Telegram {
    
    public class UsersShared : Object {
        public int? request_id;
        public int64[]? users_id;
        
        public UsersShared(Json.Object object) {
            request_id = (int) object.get_int_member("request_id");
            int64[] temp = {};
            foreach (var element in object.get_array_member("users_id").get_elements()) {
                temp += element.get_int();
            }
            users_id = temp;
        }
    }
}
