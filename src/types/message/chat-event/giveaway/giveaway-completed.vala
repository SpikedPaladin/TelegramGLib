namespace Telegram {
    
    public class GiveawayCompleted : Object {
        public int winner_count;
        public int? unclaimed_prize_count;
        public Message? giveaway_message;
        
        public GiveawayCompleted(Json.Object object) {
            winner_count = (int) object.get_string_member("winner_count");
            
            if (object.has_member("unclaimed_prize_count"))
                unclaimed_prize_count = (int) object.get_int_member("unclaimed_prize_count");
            
            if (object.has_member("giveaway_message"))
                giveaway_message = new Message(object.get_object_member("giveaway_message"));
        }
    }
}