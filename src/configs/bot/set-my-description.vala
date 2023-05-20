using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetMyDescriptionConfig : BaseConfig {
        public string? description;
        public string? language_code;
        
        public override string method() {
            return "setMyDescription";
        }
        
        public override string queue() {
            var queue = "";
            
            if (description != null)
                queue += @"&description=$description";
            
            if (language_code != null)
                queue += @"&language_code=$language_code";
            
            return queue;
        }
    }
}
