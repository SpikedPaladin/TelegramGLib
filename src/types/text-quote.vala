namespace Telegram {
    
    public class TextQuote : Object {
        public string text;
        public MessageEntity[]? entities;
        public int position;
        public bool? is_manual;
        
        public TextQuote(Json.Object object) {
            text = object.get_string_member("text");
            position = (int) object.get_int_member("position");
            
            if (object.has_member("entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                entities = temp;
            }
            
            if (object.has_member("is_manual"))
                is_manual = object.get_boolean_member("is_manual");
        }
    }
}