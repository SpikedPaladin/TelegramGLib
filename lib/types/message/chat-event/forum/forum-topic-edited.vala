namespace Telegram.Types {
	
    public class ForumTopicEdited {
        public string? name;
        public string? icon_custom_emoji_id;
        
        public ForumTopicEdited(Json.Object object) {
            if (object.has_member("name"))
                name = object.get_string_member("data");
            
            if (object.has_member("icon_custom_emoji_id"))
                icon_custom_emoji_id = object.get_string_member("icon_custom_emoji_id");
        }
    }
}
