namespace Telegram {
    
    public class ReplyKeyboardRemove : Object, Serializable, ReplyMarkup {
        private bool? selective;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("remove_keyboard");
            builder.add_boolean_value(true);
            
            if (selective != null) {
                builder.set_member_name("selective");
                builder.add_boolean_value(selective);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
