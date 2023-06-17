namespace Telegram {
    
    public class PassportElementErrorTranslationFile : Object, Serializable, PassportElementError {
        public EncryptedPassportElement.Type type;
        public string file_hash;
        public string message;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("source");
            builder.add_string_value("translation_file");
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("file_hash");
            builder.add_string_value(file_hash);
            
            builder.set_member_name("message");
            builder.add_string_value(message);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
