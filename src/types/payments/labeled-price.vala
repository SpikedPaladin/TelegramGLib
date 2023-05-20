namespace Telegram.Types {
	
    public class LabeledPrice : Object, Serializable {
        public string label;
        public int amount;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("label");
            builder.add_string_value(label);
            
            builder.set_member_name("amount");
            builder.add_int_value(amount);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
