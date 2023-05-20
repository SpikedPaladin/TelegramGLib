namespace Telegram.Types {
	
    public class InlineQuery {
        public string id;
        public User from;
        public string query;
        public string offset;
        public Chat.Type chat_type;
        public Location? location;
        
        public InlineQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            query = object.get_string_member("query");
            offset = object.get_string_member("offset");
            
            if (object.has_member("chat_type"))
                chat_type = Chat.Type.parse(object.get_string_member("chat_type"));
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
        }
    }
}
