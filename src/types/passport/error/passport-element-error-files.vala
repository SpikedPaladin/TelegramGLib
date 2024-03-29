namespace Telegram {
    
    public class PassportElementErrorFiles : Object, Serializable, PassportElementError {
        public EncryptedPassportElement.Type type;
        public string file_hashes;
        public string message;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("source");
            builder.add_string_value("files");
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("file_hashes");
            builder.add_string_value(file_hashes);
            
            builder.set_member_name("message");
            builder.add_string_value(message);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
