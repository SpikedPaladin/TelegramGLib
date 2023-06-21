namespace Telegram {
    
    public class BotCommandScopeAllChatAdministrators : Object, Serializable, BotCommandScope {
        public Type type;
        
        public BotCommandScopeAllChatAdministrators(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
