namespace Telegram {
    
    /**
     * This object represents the bot's name.
     */
    public class BotName : Object {
        /**
         * The bot's name
         */
        public string name;
        
        public BotName(Json.Object object) {
            name = object.get_string_member("name");
        }
    }
}
