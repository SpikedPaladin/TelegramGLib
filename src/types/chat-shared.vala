namespace Telegram {
    
    public class ChatShared : Object {
        public int request_id;
        public ChatId chat_id;
        
        public ChatShared(Json.Object object) {
            request_id = (int) object.get_int_member("request_id");
            chat_id = ChatId.parse(object);
        }
    }
}
