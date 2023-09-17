namespace Telegram {
    
    /**
     * This object represents the bot's short description.
     */
    public class BotShortDescription : Object {
        /**
         * The bot's short description
         */
        public string short_description;
        
        public BotShortDescription(Json.Object object) {
            short_description = object.get_string_member("short_description");
        }
    }
}
