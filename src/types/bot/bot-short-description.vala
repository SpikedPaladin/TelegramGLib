namespace Telegram {
    
    public class BotShortDescription : Object {
        public string short_description;
        
        public BotShortDescription(Json.Object object) {
            short_description = object.get_string_member("short_description");
        }
    }
}
