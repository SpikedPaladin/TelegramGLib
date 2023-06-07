namespace Telegram {
    
    public class BotName : Object {
        public string name;
        
        public BotName(Json.Object object) {
            name = object.get_string_member("name");
        }
    }
}
