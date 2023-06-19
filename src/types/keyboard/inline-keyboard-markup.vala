namespace Telegram {
    
    public class InlineKeyboardMarkup : Object, Serializable, ReplyMarkup {
        public List<List<InlineKeyboardButton>> inline_keyboard;
        
        public InlineKeyboardMarkup(Json.Object? object = null) {
            inline_keyboard = new List<List<InlineKeyboardButton>>();
            if (object != null) {
                foreach (var array in object.get_array_member("inline_keyboard").get_elements()) {
                    inline_keyboard.append(new List<InlineKeyboardButton>());
                    
                    foreach (var button in array.get_array().get_elements()) {
                        inline_keyboard.last().data.append(new InlineKeyboardButton(button.get_object()));
                    }
                }
            }
        }
        
        public InlineKeyboardMarkup add_button(InlineKeyboardButton button) {
            if (inline_keyboard.length() == 0) {
                inline_keyboard.append(new List<InlineKeyboardButton>());
            }
            
            inline_keyboard.last().data.append(button);
            return this;
        }
        
        public InlineKeyboardMarkup new_row() {
            inline_keyboard.append(new List<InlineKeyboardButton>());
            
            return this;
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("inline_keyboard");
            builder.begin_array();
            
            foreach (var row in inline_keyboard.copy()) {
                builder.begin_array();
                
                foreach (var button in row) {
                    builder.add_value(button.serialize());
                }
                
                builder.end_array();
            }
            
            builder.end_array();
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
