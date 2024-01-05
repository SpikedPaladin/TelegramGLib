namespace Telegram {
    
    public class ChatMemberBanned : Object, ChatMember {
        public User user;
        public int64 until_date;
        
        public ChatMemberBanned(Json.Object object) {
            user = new User(object.get_object_member("user"));
            until_date = object.get_int_member("until_date");
        }
    }
}
