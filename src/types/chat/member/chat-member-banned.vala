namespace Telegram.Types {
	
    public class ChatMemberBanned : ChatMember {
        public int64 until_date;
        
        public ChatMemberBanned(Json.Object object) {
            base(object);
            
            until_date = object.get_int_member("until_date");
        }
    }
}
