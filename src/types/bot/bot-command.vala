namespace Telegram {
    
    /**
     * This object represents a bot command.
     */
    public class BotCommand : Object, Serializable {
        /**
         * Text of the command; 1-32 characters.  
         * Can contain only lowercase English letters, digits and underscores.
         */
        public string command;
        /**
         * Description of the command; 1-256 characters.
         */
        public string description;
        
        public BotCommand(Json.Object? object = null) {
            if (object == null)
                return;
            
            command = object.get_string_member("command");
            description = object.get_string_member("description");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("command");
            builder.add_string_value(command);
            
            builder.set_member_name("description");
            builder.add_string_value(description);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
