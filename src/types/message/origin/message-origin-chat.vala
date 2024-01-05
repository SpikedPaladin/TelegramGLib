namespace Telegram {
    
    public class MessageOriginChat : MessageOrigin, Object {
        public Type type;
        public int64 date;
        public Chat sender_chat;
        public string? author_signature;
        
        public MessageOriginChat(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            date = object.get_int_member("date");
            sender_chat = new Chat(object.get_object_member("sender_chat"));
            
            if (object.has_member("author_signature"))
                author_signature = object.get_string_member("author_signature");
        }
    }
}