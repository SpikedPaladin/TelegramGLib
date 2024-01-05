namespace Telegram {
    
    public class MessageOriginChannel : MessageOrigin, Object {
        public int64 date;
        public Chat chat;
        public int message_id;
        public string? author_signature;
        
        public MessageOriginChannel(Json.Object object) {
            date = object.get_int_member("date");
            chat = new Chat(object.get_object_member("chat"));
            message_id = (int) object.get_int_member("message_id");
            
            if (object.has_member("author_signature"))
                author_signature = object.get_string_member("author_signature");
        }
    }
}