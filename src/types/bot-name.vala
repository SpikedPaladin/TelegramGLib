namespace Telegram.Types {
	
    public class BotName {
        public string name;
        
        public BotName(Json.Object object) {
            name = object.get_string_member("name");
        }
    }
}
