namespace Telegram {
    
    public class Giveaway : Object {
        public Chat[] chats;
        public int64 winners_selection_date;
        public int winner_count;
        public bool? only_new_members;
        public bool? has_public_winners;
        public string? prize_description;
        public string[]? country_codes;
        public int? premium_subscription_month_count;
        
        public Giveaway(Json.Object object) {
            {
                Chat[] temp = {};
                foreach (var element in object.get_array_member("chats").get_elements()) {
                    temp += new Chat(element.get_object());
                }
                chats = temp;
            }
            winners_selection_date = object.get_int_member("winners_selection_date");
            winner_count = (int) object.get_int_member("winner_count");
            
            if (object.has_member("only_new_members"))
                only_new_members = object.get_boolean_member("only_new_members");
            
            if (object.has_member("has_public_winners"))
                has_public_winners = object.get_boolean_member("has_public_winners");
            
            if (object.has_member("prize_description"))
                prize_description = object.get_string_member("prize_description");
            
            if (object.has_member("country_codes")) {
                string[] temp = {};
                
                foreach (var element in object.get_array_member("country_codes").get_elements())
                    temp += element.get_string();
                
                country_codes = temp;
            }
            
            if (object.has_member("premium_subscription_month_count"))
                premium_subscription_month_count = (int) object.get_int_member("premium_subscription_month_count");
        }
    }
}