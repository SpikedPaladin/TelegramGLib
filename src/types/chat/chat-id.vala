namespace Telegram {
    
    [Compact]
    public class ChatId : Object {
        public string? username;
        public int64? id;
        
        public ChatId(int64 id) {
            this.id = id;
        }
        
        public ChatId.from_username(string username) {
            this.username = username;
        }
        
        public static ChatId parse(Json.Object object, string member_name = "chat_id") {
            var chat_id = new ChatId(object.get_int_member(member_name));
            
            if (chat_id.id == null)
                chat_id.username = object.get_string_member(member_name);
            
            return chat_id;
        }
        
        public Json.Builder append(Json.Builder builder, string member_name = "chat_id") {
            builder.set_member_name(member_name);
            
            if (id != null)
                builder.add_int_value(id);
            else
                builder.add_string_value(username);
            
            return builder;
        }
        
        public string to_string() {
            return username ?? @"$id";
        }
    }
}
