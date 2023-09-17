namespace Telegram {
    
    /**
     * This object represents the bot's description.
     */
    public class BotDescription : Object {
        /**
         * The bot's description
         */
        public string description;
        
        public BotDescription(Json.Object object) {
            description = object.get_string_member("description");
        }
    }
}
