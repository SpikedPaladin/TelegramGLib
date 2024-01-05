namespace Telegram {
    
    /**
     * Represents the scope of bot commands, covering all group and supergroup chat administrators.
     */
    public class BotCommandScopeAllChatAdministrators : Object, Serializable, BotCommandScope {
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(Type.ALL_CHAT_ADMINISTRATORS.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
