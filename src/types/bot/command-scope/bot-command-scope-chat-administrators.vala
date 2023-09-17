namespace Telegram {
    
    /**
     * Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.
     */
    public class BotCommandScopeChatAdministrators : Object, Serializable, BotCommandScope {
        public Type type = Type.CHAT_ADMINISTRATORS;
        /**
         * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
         */
        public ChatId chat_id;
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            chat_id.append(builder);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
