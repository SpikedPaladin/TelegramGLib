namespace Telegram.Types {
	
    public class ChosenInlineResult {
        public string result_id;
        public User from;
        public Location? location;
        public string? inline_message_id;
        public string query;
        
        public ChosenInlineResult(Json.Object object) {
            result_id = object.get_string_member("result_id");
            from = new User(object.get_object_member("from"));
            query = object.get_string_member("query");
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
            
            if (object.has_member("inline_message_id"))
                inline_message_id = object.get_string_member("inline_message_id");
        }
    }
}
