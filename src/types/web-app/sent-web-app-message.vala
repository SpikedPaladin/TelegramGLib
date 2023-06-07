namespace Telegram {
    
    public class SentWebAppMessage : Object {
        public string? inline_message_id;
        
        public SentWebAppMessage(Json.Object object) {
            if (object.has_member("inline_message_id"))
                inline_message_id = object.get_string_member("inline_message_id");
        }
    }
}
