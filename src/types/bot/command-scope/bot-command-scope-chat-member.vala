namespace Telegram {
    
    /**
     * Represents the scope of bot commands, covering a specific member of a group or supergroup chat.
     */
    public class BotCommandScopeChatMember : Object, Serializable, BotCommandScope {
        /**
         * Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
         */
        public ChatId chat_id;
        /**
         * Unique identifier of the target user
         */
        public int64 user_id;
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(Type.CHAT_MEMBER.to_string());
            
            chat_id.append(builder);
            
            builder.set_member_name("user_id");
            builder.add_int_value(user_id);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
