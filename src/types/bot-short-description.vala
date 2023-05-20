namespace Telegram.Types {
	
    public class BotShortDescription {
        public string short_description;
        
        public BotShortDescription(Json.Object object) {
            short_description = object.get_string_member("short_description");
        }
    }
}
