namespace Telegram {
    
    public class VideoChatScheduled : Object {
        public int64 start_date;
        
        public VideoChatScheduled(Json.Object object) {
            start_date = object.get_int_member("start_date");
        }
    }
}
