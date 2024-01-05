namespace Telegram {
    
    public class GiveawayWinners : Object {
        public Chat chat;
        public int giveaway_message_id;
        public int64 winners_selection_date;
        public int winner_count;
        public User[] winners;
        public int? additional_chat_count;
        public int? premium_subscription_month_count;
        public int? unclaimed_prize_count;
        public bool? only_new_members;
        public bool? was_refunded;
        public string? prize_description;
        
        public GiveawayWinners(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            giveaway_message_id = (int) object.get_int_member("giveaway_message_id");
            winners_selection_date = object.get_int_member("winners_selection_date");
            winner_count = (int) object.get_int_member("winner_count");
            {
                User[] temp = {};
                foreach (var element in object.get_array_member("winners").get_elements()) {
                    temp += new User(element.get_object());
                }
                winners = temp;
            }
            
            if (object.has_member("additional_chat_count"))
                additional_chat_count = (int) object.get_int_member("additional_chat_count");
            
            if (object.has_member("premium_subscription_month_count"))
                premium_subscription_month_count = (int) object.get_int_member("premium_subscription_month_count");
            
            if (object.has_member("unclaimed_prize_count"))
                unclaimed_prize_count = (int) object.get_int_member("unclaimed_prize_count");
            
            if (object.has_member("only_new_members"))
                only_new_members = object.get_boolean_member("only_new_members");
            
            if (object.has_member("was_refunded"))
                was_refunded = object.get_boolean_member("was_refunded");
            
            if (object.has_member("prize_description"))
                prize_description = object.get_string_member("prize_description");
        }
    }
}