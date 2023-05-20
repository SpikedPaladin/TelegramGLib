namespace Telegram.Types {
	
    public class PassportElementErrorDataField : Object, Serializable, PassportElementError {
        public EncryptedPassportElement.Type type;
        public string field_name;
        public string data_hash;
        public string message;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("source");
            builder.add_string_value("data");
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("field_name");
            builder.add_string_value(field_name);
            
            builder.set_member_name("data_hash");
            builder.add_string_value(data_hash);
            
            builder.set_member_name("message");
            builder.add_string_value(message);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
