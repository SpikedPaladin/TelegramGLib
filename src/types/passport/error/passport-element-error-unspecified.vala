namespace Telegram {
    
    public class PassportElementErrorUnspecified : Object, Serializable, PassportElementError {
        public EncryptedPassportElement.Type type;
        public string element_hash;
        public string message;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("source");
            builder.add_string_value("front_side");
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("element_hash");
            builder.add_string_value(element_hash);
            
            builder.set_member_name("message");
            builder.add_string_value(message);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
