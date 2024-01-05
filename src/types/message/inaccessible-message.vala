namespace Telegram {
    
    public class InaccessibleMessage : MaybeInaccessibleMessage, Object {
        public Chat chat;
        public int message_id;
        public int64 date;
        
        public InaccessibleMessage(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
        }
    }
}