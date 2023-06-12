namespace Telegram {
    
    public class CreateForumTopic : BaseRequest {
        public ChatId chat_id;
        public string name;
        public int? icon_color;
        public bool? icon_custom_emoji_id;
        
        public override string method() {
            return "createForumTopic";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&name=$name";
            
            if (icon_color != null)
                queue += @"&icon_color=$icon_color";
            
            if (icon_custom_emoji_id != null)
                queue += @"&icon_custom_emoji_id=$icon_custom_emoji_id";
            
            return queue;
        }
    }
}
