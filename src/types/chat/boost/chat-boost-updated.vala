namespace Telegram {
    
    public class ChatBoostUpdated : Object {
        public Chat chat;
        public ChatBoost boost;
        
        public ChatBoostUpdated(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            boost = new ChatBoost(object.get_object_member("boost"));
        }
    }
}