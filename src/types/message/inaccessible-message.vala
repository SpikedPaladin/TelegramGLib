namespace Telegram {
    
    public class InaccessibleMessage : MaybeInaccessibleMessage {
        
        public InaccessibleMessage(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
        }
    }
}