using Telegram.Types;

namespace Telegram.Configs {
	
    public class SetMyNameConfig : BaseConfig {
        public string? name;
        public string? language_code;
        
        public override string method() {
            return "setMyName";
        }
        
        public override string queue() {
            var queue = "";
            
            if (name != null)
                queue += @"&name=$name";
            
            if (language_code != null)
                queue += @"&language_code=$language_code";
            
            return queue;
        }
    }
}
