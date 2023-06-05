namespace Telegram {
    
    public class ForumTopicCreated {
        public string name;
        public int icon_color;
        public string? icon_custom_emoji_id;
        
        public ForumTopicCreated(Json.Object object) {
            name = object.get_string_member("data");
            icon_color = (int) object.get_int_member("button_text");
            
            if (object.has_member("icon_custom_emoji_id"))
                icon_custom_emoji_id = object.get_string_member("icon_custom_emoji_id");
        }
    }
}
