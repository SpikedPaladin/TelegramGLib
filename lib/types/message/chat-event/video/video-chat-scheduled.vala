namespace Telegram.Types {
	
    public class VideoChatScheduled {
        public int64 start_date;
        
        public VideoChatScheduled(Json.Object object) {
            start_date = object.get_int_member("start_date");
        }
    }
}
