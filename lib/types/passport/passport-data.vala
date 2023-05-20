namespace Telegram.Types {
	
    public class PassportData {
        public EncryptedPassportElement[] data;
        public EncryptedCredentials credentials;
        
        public PassportData(Json.Object object) {
            EncryptedPassportElement[] temp_data = {};
            foreach (var element in object.get_array_member("data").get_elements()) {
                temp_data += new EncryptedPassportElement(element.get_object());
            }
            data = temp_data;
            
            credentials = new EncryptedCredentials(object.get_object_member("credentials"));
        }
    }
}
