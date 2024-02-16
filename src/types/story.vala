namespace Telegram {
    
    public class Story : Object {
        public Chat chat;
        public int id;
        
        public Story(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            id = (int) object.get_int_member("id");
        }
    }
}
