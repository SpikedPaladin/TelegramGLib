namespace Telegram {
    
    public interface MaybeInaccessibleMessage : Object {
        
        public static MaybeInaccessibleMessage from_json(Json.Object object) {
            if (object.get_int_member("date") == 0)
                return new InaccessibleMessage(object);
            else
                return new Message(object);
        }
    }
}