using Telegram.Types;

namespace Telegram.Configs {
	
    public class DeleteChatPhotoConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "deleteChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
}
