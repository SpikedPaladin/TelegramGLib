namespace Telegram {
    
    public class KeyboardButtonRequestChat : Object, Serializable {
        public int request_id;
        public bool chat_is_channel;
        public bool? chat_is_forum;
        public bool? chat_has_username;
        public bool? chat_is_created;
        public ChatAdministratorRights? user_administrator_rights;
        public ChatAdministratorRights? bot_administrator_rights;
        public bool? bot_is_member;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("request_id");
            builder.add_int_value(request_id);
            
            builder.set_member_name("chat_is_channel");
            builder.add_boolean_value(chat_is_channel);
            
            if (chat_is_forum != null) {
                builder.set_member_name("chat_is_forum");
                builder.add_boolean_value(chat_is_forum);
            }
            
            if (chat_has_username != null) {
                builder.set_member_name("chat_has_username");
                builder.add_boolean_value(chat_has_username);
            }
            
            if (chat_is_created != null) {
                builder.set_member_name("chat_is_created");
                builder.add_boolean_value(chat_is_created);
            }
            
            if (user_administrator_rights != null) {
                builder.set_member_name("user_administrator_rights");
                builder.add_value(user_administrator_rights.serialize());
            }
            
            if (bot_administrator_rights != null) {
                builder.set_member_name("bot_administrator_rights");
                builder.add_value(bot_administrator_rights.serialize());
            }
            
            if (bot_is_member != null) {
                builder.set_member_name("bot_is_member");
                builder.add_boolean_value(bot_is_member);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
