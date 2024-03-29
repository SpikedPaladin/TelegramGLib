namespace Telegram {
    
    public class SetChatMenuButton : AbstractRequest {
        public ChatId? chat_id;
        public MenuButton? menu_button;
        
        public override string method() {
            return "setChatMenuButton";
        }
        
        public override string queue() {
            var queue = "";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (menu_button != null)
                queue += @"&menu_button=$menu_button";
            
            return queue;
        }
    }
}
