namespace Telegram {
    
    public class BotDescription : Object {
        public string description;
        
        public BotDescription(Json.Object object) {
            description = object.get_string_member("description");
        }
    }
}
