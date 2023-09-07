namespace Telegram {
    
    public class BotCommandScopeChatMember : Object, Serializable, BotCommandScope {
        public Type type = Type.CHAT_MEMBER;
        public ChatId chat_id;
        public int64 user_id;
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            chat_id.append(builder);
            
            builder.set_member_name("user_id");
            builder.add_int_value(user_id);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
