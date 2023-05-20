using Telegram.Types;

namespace Telegram.Requests {
	
    public class SetChatTitle : BaseRequest {
        public int64 chat_id;
        public string title;
        
        public override string method() {
            return "setChatTitle";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&title=$title";
        }
    }
}
