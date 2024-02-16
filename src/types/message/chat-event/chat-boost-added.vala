namespace Telegram {
    
    public class ChatBoostAdded : Object {
        public int boost_count;
        
        public ChatBoostAdded(Json.Object object) {
            boost_count = (int) object.get_int_member("boost_count");
        }
    }
}