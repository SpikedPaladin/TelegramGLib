namespace Telegram {
    
    public class DeleteMyCommands : AbstractRequest {
        public BotCommandScope? scope;
        public string? language_code;
        
        public override string method() {
            return "deleteMyCommands";
        }
        
        public override string queue() {
            var queue = "";
            
            if (scope != null)
                queue += @"&scope=$scope";
            
            if (language_code != null)
                queue += @"&language_code=$language_code";
            
            return queue;
        }
    }
}
