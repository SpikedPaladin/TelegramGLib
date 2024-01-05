namespace Telegram {
    
    public abstract class MaybeInaccessibleMessage : Object {
        public Chat chat;
        public int message_id;
        public int64 date;
        
        public static MaybeInaccessibleMessage from_json(Json.Object object) {
            if (object.get_int_member("date") == 0)
                return new InaccessibleMessage(object);
            else
                return new Message(object);
        }
    }
}