namespace Telegram {
    
    public class VideoChatEnded : Object {
        public int64 duration;
        
        public VideoChatEnded(Json.Object object) {
            duration = object.get_int_member("duration");
        }
    }
}
