namespace Telegram.Types {
	
    public class ForceReply : Object, Serializable, ReplyMarkup {
        private string? input_field_placeholder;
        private bool? selective;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("force_reply");
            builder.add_boolean_value(true);
            
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
