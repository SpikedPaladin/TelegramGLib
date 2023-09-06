namespace Telegram {
    
    public class MessageHandler : AbstractHandler {
        public MessageHandlerConditionFunc condition;
        public MessageHandlerFunc action;
        public string? text;
        
        public MessageHandler(string? text, owned MessageHandlerFunc action, owned MessageHandlerConditionFunc? condition = null) {
            this.text = text;
            this.action = (owned) action;
            this.condition = (owned) condition;
        }
    }
    
    public delegate void MessageHandlerFunc(Message message);
    public delegate bool MessageHandlerConditionFunc(Message message);
}
