namespace Telegram {
    
    public class InlineQueryHandler : AbstractHandler {
        public InlineQueryHandlerConditionFunc condition;
        public InlineQueryHandlerFunc action;
        public string query;
        
        public InlineQueryHandler(string query, owned InlineQueryHandlerFunc action, owned InlineQueryHandlerConditionFunc? condition = null) {
            this.query = query;
            this.action = (owned) action;
            this.condition = (owned) condition;
        }
    }
    
    public delegate void InlineQueryHandlerFunc(InlineQuery inline_query);
    public delegate bool InlineQueryHandlerConditionFunc(InlineQuery inline_query);
}
