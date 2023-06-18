namespace Telegram {
    
    public class BotCommand : Object, Serializable {
        public string command;
        public string description;
        
        public BotCommand(Json.Object object) {
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
