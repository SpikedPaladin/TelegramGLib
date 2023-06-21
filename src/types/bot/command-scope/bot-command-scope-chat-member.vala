namespace Telegram {
    
    public class BotCommandScopeChatMember : Object, Serializable, BotCommandScope {
        public Type type;
        public ChatId chat_id;
        public int64 user_id;
        
        public BotCommandScopeChatMember(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            chat_id = ChatId.parse(object);
            user_id = object.get_int_member("user_id");
        }
        
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
