namespace Telegram.Types {
	
    public class SwitchInlineQueryChosenChat : Object, Serializable {
        public string? query;
        public bool? allow_user_chats;
        public bool? allow_bot_chats;
        public bool? allow_group_chats;
        public bool? allow_channel_chats;
        
        public SwitchInlineQueryChosenChat(Json.Object object) {
            if (object.has_member("query"))
                query = object.get_string_member("query");
            
            if (object.has_member("allow_user_chats"))
                allow_user_chats = object.get_boolean_member("allow_user_chats");
            
            if (object.has_member("allow_bot_chats"))
                allow_bot_chats = object.get_boolean_member("allow_bot_chats");
            
            if (object.has_member("allow_group_chats"))
                allow_group_chats = object.get_boolean_member("allow_group_chats");
            
            if (object.has_member("allow_channel_chats"))
                allow_channel_chats = object.get_boolean_member("allow_channel_chats");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            if (query != null) {
                builder.set_member_name("query");
                builder.add_string_value(query);
            }
            
            if (allow_user_chats != null) {
                builder.set_member_name("allow_user_chats");
                builder.add_boolean_value(allow_user_chats);
            }
            
            if (allow_bot_chats != null) {
                builder.set_member_name("allow_bot_chats");
                builder.add_boolean_value(allow_bot_chats);
            }
            
            if (allow_group_chats != null) {
                builder.set_member_name("allow_group_chats");
                builder.add_boolean_value(allow_group_chats);
            }
            
            if (allow_channel_chats != null) {
                builder.set_member_name("allow_channel_chats");
                builder.add_boolean_value(allow_channel_chats);
            }
            
            return builder.get_root();
        }
    }
}
