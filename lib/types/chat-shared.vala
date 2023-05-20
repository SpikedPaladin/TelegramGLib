namespace Telegram.Types {
	
    public class ChatShared {
        public int request_id;
        public int64 chat_id;
        
        public ChatShared(Json.Object object) {
            request_id = (int) object.get_int_member("request_id");
            chat_id = object.get_int_member("chat_id");
        }
    }
}
