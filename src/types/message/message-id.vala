namespace Telegram {
    
    public class MessageId : Object {
        public int message_id;
        
        public MessageId(Json.Object object) {
            message_id = (int) object.get_int_member("message_id");
        }
    }
}
