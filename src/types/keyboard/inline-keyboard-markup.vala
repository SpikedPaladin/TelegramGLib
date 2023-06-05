using Gee;

namespace Telegram {
    
    public class InlineKeyboardMarkup : Object, Serializable, ReplyMarkup {
        public ArrayList<ArrayList<InlineKeyboardButton>> inline_keyboard;
        
        public InlineKeyboardMarkup(Json.Object? object = null) {
            inline_keyboard = new ArrayList<ArrayList<InlineKeyboardButton>>();
            if (object != null) {
                foreach (var array in object.get_array_member("inline_keyboard").get_elements()) {
                    inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
                    
                    foreach (var button in array.get_array().get_elements()) {
                        inline_keyboard.get(inline_keyboard.size - 1).add(new InlineKeyboardButton(button.get_object()));
                    }
                }
            }
        }
        
        public InlineKeyboardMarkup add_button(InlineKeyboardButton button) {
            if (inline_keyboard.size == 0) {
                inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
            }
            
            inline_keyboard.get(inline_keyboard.size - 1).add(button);
            return this;
        }
        
        public InlineKeyboardMarkup new_row() {
            inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
            
            return this;
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("inline_keyboard");
            builder.begin_array();
            
            foreach (var array in inline_keyboard) {
                builder.begin_array();
                
                foreach (var button in array) {
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
