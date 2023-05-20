using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetMyCommandsConfig : BaseConfig {
        public BotCommand[] commands;
        public BotCommandScope? scope;
        public string? language_code;
        
        public override string method() {
            return "setMyCommands";
        }
        
        public override string queue() {
            Serializable[] arr = {};
            foreach (var element in commands) {
                arr += element;
            }
            var queue = @"commands=$(Serializable.array_to_string(arr))";
            
            if (scope != null)
                queue += @"&scope=$scope";
            
            if (language_code != null)
                queue += @"&language_code=$language_code";
            
            return queue;
        }
    }
}
