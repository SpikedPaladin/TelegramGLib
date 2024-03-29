namespace Telegram {
    
    public class SetMyShortDescription : AbstractRequest {
        public string? short_description;
        public string? language_code;
        
        public override string method() {
            return "setMyShortDescription";
        }
        
        public override string queue() {
            var queue = "";
            
            if (short_description != null)
                queue += @"&short_description=$short_description";
            
            if (language_code != null)
                queue += @"&language_code=$language_code";
            
            return queue;
        }
    }
}
