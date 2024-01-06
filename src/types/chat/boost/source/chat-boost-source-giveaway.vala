namespace Telegram {
    
    public class ChatBoostSourceGiveaway : Object, ChatBoostSource {
        public int giveaway_message_id;
        public User? user;
        public bool? is_unclaimed;
        
        public ChatBoostSourceGiveaway(Json.Object object) {
            giveaway_message_id = (int) object.get_int_member("giveaway_message_id");
            
            if (object.has_member("user"))
                user = new User(object.get_object_member("user"));
            
            if (object.has_member("is_unclaimed"))
                is_unclaimed = object.get_boolean_member("is_unclaimed");
        }
    }
}