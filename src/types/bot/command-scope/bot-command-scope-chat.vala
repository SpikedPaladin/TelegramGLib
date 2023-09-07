namespace Telegram {
    
    public class BotCommandScopeChat : Object, Serializable, BotCommandScope {
        public Type type = Type.CHAT;
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
