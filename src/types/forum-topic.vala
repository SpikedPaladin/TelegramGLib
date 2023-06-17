namespace Telegram {
    
    public class ForumTopic : Object {
        public int message_thread_id;
        public string name;
        public int icon_color;
        public string? icon_custom_emoji_id;
        
        public ForumTopic(Json.Object object) {
            message_thread_id = (int) object.get_int_member("message_thread_id");
            name = object.get_string_member("name");
            icon_color = (int) object.get_int_member("icon_color");
            
            if (object.has_member("icon_custom_emoji_id"))
                icon_custom_emoji_id = object.get_string_member("icon_custom_emoji_id");
        }
    }
}
