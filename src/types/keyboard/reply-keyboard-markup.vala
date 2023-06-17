namespace Telegram {
    
    public class ReplyKeyboardMarkup : Object, Serializable, ReplyMarkup {
        public List<List<KeyboardButton>> keyboard;
        public bool? is_persistent;
        public bool? resize_keyboard;
        public bool? one_time_keyboard;
        public string? input_field_placeholder;
        public bool? selective;
        
        public ReplyKeyboardMarkup() {
            keyboard = new List<List<KeyboardButton>>();
        }
        
        public ReplyKeyboardMarkup add_button(KeyboardButton button) {
            if (keyboard.length() == 0) {
                keyboard.append(new List<KeyboardButton>());
            }
            
            keyboard.last().data.append(button);
            return this;
        }
        
        public ReplyKeyboardMarkup new_row() {
            keyboard.append(new List<KeyboardButton>());
            
            return this;
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("keyboard");
            builder.begin_array();
            
            keyboard.foreach(row => {
                builder.begin_array();
                
                row.foreach(button => {
                    builder.add_value(button.serialize());
                });
                
                builder.end_array();
            });
            builder.end_array();
            
            if (is_persistent != null) {
                builder.set_member_name("is_persistent");
                builder.add_boolean_value(is_persistent);
            }
            
            if (resize_keyboard != null) {
                builder.set_member_name("resize_keyboard");
                builder.add_boolean_value(resize_keyboard);
            }
            
            if (one_time_keyboard != null) {
                builder.set_member_name("one_time_keyboard");
                builder.add_boolean_value(one_time_keyboard);
            }
            
            if (input_field_placeholder != null) {
                builder.set_member_name("input_field_placeholder");
                builder.add_string_value(input_field_placeholder);
            }
            
            if (selective != null) {
                builder.set_member_name("selective");
                builder.add_boolean_value(selective);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
