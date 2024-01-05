namespace Telegram {
    
    public class UserChatBoosts : Object {
        public ChatBoost[] boosts;
        
        public UserChatBoosts(Json.Object object) {
            ChatBoost[] temp = {};
            foreach (var element in object.get_array_member("boosts").get_elements()) {
                temp += new ChatBoost(element.get_object());
            }
            boosts = temp;
        }
    }
}