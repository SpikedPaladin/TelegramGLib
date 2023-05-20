namespace Telegram.Types {
	
    public class VideoChatEnded {
        public int64 duration;
        
        public VideoChatEnded(Json.Object object) {
            duration = object.get_int_member("duration");
        }
    }
}
