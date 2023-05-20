namespace Telegram.Types {
	
    public class BotDescription {
        public string description;
        
        public BotDescription(Json.Object object) {
            description = object.get_string_member("description");
        }
    }
}
