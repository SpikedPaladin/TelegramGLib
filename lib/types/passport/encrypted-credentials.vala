namespace Telegram.Types {
	
    public class EncryptedCredentials {
        public string data;
        public string hash;
        public string secret;
        
        public EncryptedCredentials(Json.Object object) {
            data = object.get_string_member("data");
            hash = object.get_string_member("hash");
            secret = object.get_string_member("secret");
        }
    }
}
