namespace Telegram {
    
    public class MessageOriginHiddenUser : MessageOrigin {
        public string sender_user_name;
        
        public MessageOriginHiddenUser(Json.Object object) {
            date = object.get_int_member("date");
            sender_user_name = object.get_string_member("sender_user_name");
        }
    }
}