using Telegram.Types;

namespace Telegram.Configs {
	
    public class AnswerWebAppQuery : BaseConfig {
        public string web_app_query_id;
        public InlineQueryResult result;
        
        public override string method() {
            return "answerWebAppQuery";
        }
        
        public override string queue() {
            var queue = @"web_app_query_id=$web_app_query_id&result=$result";
            
            return queue;
        }
    }
}
