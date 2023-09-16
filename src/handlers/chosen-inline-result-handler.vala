namespace Telegram {
    
    public class ChosenInlineQueryResultHandler : AbstractHandler {
        public ChosenInlineQueryResultHandlerConditionFunc condition;
        public ChosenInlineQueryResultHandlerFunc action;
        public string? result_id;
        
        public ChosenInlineQueryResultHandler(string? result_id, owned ChosenInlineQueryResultHandlerFunc action, owned ChosenInlineQueryResultHandlerConditionFunc? condition = null) {
            this.result_id = result_id;
            this.action = (owned) action;
            this.condition = (owned) condition;
        }
    }
    
    public delegate void ChosenInlineQueryResultHandlerFunc(ChosenInlineResult chosen_inline_result);
    public delegate bool ChosenInlineQueryResultHandlerConditionFunc(ChosenInlineResult chosen_inline_result);
}
