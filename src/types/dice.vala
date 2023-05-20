namespace Telegram.Types {
	
    public class Dice {
        public string emoji;
        public int @value;
        
        public Dice(Json.Object object) {
            emoji = object.get_string_member("emoji");
            @value = (int) object.get_int_member("value");
        }
    }
}
