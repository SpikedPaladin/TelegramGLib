namespace Telegram {
    
    /**
     * Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user.
     */
    public class BotCommandScopeDefault : Object, Serializable, BotCommandScope {
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(Type.DEFAULT.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
