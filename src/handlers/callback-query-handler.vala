namespace Telegram {
    
    public class CallbackQueryHandler : AbstractHandler {
        public CallbackQueryHandlerConditionFunc condition;
        public CallbackQueryHandlerFunc action;
        public string? data;
        
        public CallbackQueryHandler(string? data, owned CallbackQueryHandlerFunc action, owned CallbackQueryHandlerConditionFunc? condition = null) {
            this.data = data;
            this.action = (owned) action;
            this.condition = (owned) condition;
        }
    }
    
    public delegate void CallbackQueryHandlerFunc(CallbackQuery callback_query);
    public delegate bool CallbackQueryHandlerConditionFunc(CallbackQuery callback_query);
}
