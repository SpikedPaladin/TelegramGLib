namespace Telegram {
    
    public class MessageAutoDeleteTimerChanged {
        public int message_auto_delete_time;
        
        public MessageAutoDeleteTimerChanged(Json.Object object) {
            message_auto_delete_time = (int) object.get_int_member("message_auto_delete_time");
        }
    }
}
