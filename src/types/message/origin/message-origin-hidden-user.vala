namespace Telegram {
    
    public class MessageOriginHiddenUser : MessageOrigin, Object {
        public Type type;
        public int64 date;
        public string sender_user_name;
        
        public MessageOriginHiddenUser(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            date = object.get_int_member("date");
            sender_user_name = object.get_string_member("sender_user_name");
        }
    }
}