namespace Telegram {
    
    /**
     * Represents the scope of bot commands, covering a specific chat.
     */
    public class BotCommandScopeChat : Object, Serializable, BotCommandScope {
        /**
         * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
         */
        public ChatId chat_id;
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(Type.CHAT.to_string());
            
            chat_id.append(builder);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
