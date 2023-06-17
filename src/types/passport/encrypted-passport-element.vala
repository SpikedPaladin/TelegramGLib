namespace Telegram {
    
    public class EncryptedPassportElement : Object {
        public Type type;
        public string? data;
        public string? phone_number;
        public string? email;
        public PassportFile[]? files;
        public PassportFile? front_side;
        public PassportFile? reverse_side;
        public PassportFile? selfie;
        public PassportFile[]? translation;
        public string hash;
        
        public EncryptedPassportElement(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            hash = object.get_string_member("hash");
            
            if (object.has_member("data"))
                data = object.get_string_member("data");
            
            if (object.has_member("phone_number"))
                phone_number = object.get_string_member("phone_number");
            
            if (object.has_member("email"))
                email = object.get_string_member("email");
            
            if (object.has_member("files")) {
                PassportFile[] temp = {};
                foreach (var element in object.get_array_member("files").get_elements()) {
                    temp += new PassportFile(element.get_object());
                }
                files = temp;
            }
            
            if (object.has_member("front_side"))
                front_side = new PassportFile(object.get_object_member("front_side"));
            
            if (object.has_member("reverse_side"))
                reverse_side = new PassportFile(object.get_object_member("reverse_side"));
            
            if (object.has_member("selfie"))
                selfie = new PassportFile(object.get_object_member("selfie"));
            
            if (object.has_member("translation")) {
                PassportFile[] temp = {};
                foreach (var element in object.get_array_member("translation").get_elements()) {
                    temp += new PassportFile(element.get_object());
                }
                translation = temp;
            }
        }
        
        public enum Type {
            PERSONAL_DETAILS,
            PASSPORT,
            DRIVER_LICENSE,
            IDENTITY_CARD,
            INTERNAL_PASSPORT,
            ADDRESS,
            UTILITY_BILL,
            BANK_STATEMENT,
            RENTAL_AGREEMENT,
            PASSPORT_REGISTRATION,
            TEMPORARY_REGISTRATION,
            PHONE_NUMBER,
            EMAIL;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "personal_details":
                        return PERSONAL_DETAILS;
                    case "passport":
                        return PASSPORT;
                    case "driver_license":
                        return DRIVER_LICENSE;
                    case "identity_card":
                        return IDENTITY_CARD;
                    case "internal_passport":
                        return INTERNAL_PASSPORT;
                    case "address":
                        return ADDRESS;
                    case "utility_bill":
                        return UTILITY_BILL;
                    case "bank_statement":
                        return BANK_STATEMENT;
                    case "rental_agreement":
                        return RENTAL_AGREEMENT;
                    case "passport_registration":
                        return PASSPORT_REGISTRATION;
                    case "temporary_registration":
                        return TEMPORARY_REGISTRATION;
                    case "phone_number":
                        return PHONE_NUMBER;
                    case "email":
                        return EMAIL;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case PERSONAL_DETAILS:
                        return "personal_details";
                    case PASSPORT:
                        return "passport";
                    case DRIVER_LICENSE:
                        return "driver_license";
                    case IDENTITY_CARD:
                        return "identity_card";
                    case INTERNAL_PASSPORT:
                        return "internal_passport";
                    case ADDRESS:
                        return "address";
                    case UTILITY_BILL:
                        return "utility_bill";
                    case BANK_STATEMENT:
                        return "bank_statement";
                    case RENTAL_AGREEMENT:
                        return "rental_agreement";
                    case PASSPORT_REGISTRATION:
                        return "passport_registration";
                    case TEMPORARY_REGISTRATION:
                        return "temporary_registration";
                    case PHONE_NUMBER:
                        return "phone_number";
                    case EMAIL:
                        return "email";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
