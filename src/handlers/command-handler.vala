namespace Telegram {
    
    public class CommandHandler : AbstractHandler {
        public MessageHandlerConditionFunc condition;
        public MessageHandlerFunc action;
        public string? command;
        
        public CommandHandler(string? command, owned MessageHandlerFunc action, owned MessageHandlerConditionFunc? condition = null) {
            this.command = command;
            this.action = (owned) action;
            this.condition = (owned) condition;
        }
    }
}
