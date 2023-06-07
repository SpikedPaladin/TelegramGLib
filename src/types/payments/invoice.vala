namespace Telegram {
    
    public class Invoice : Object {
        public string title;
        public string description;
        public string start_parameter;
        public string currency;
        public int total_amount;
        
        public Invoice(Json.Object object) {
            title = object.get_string_member("title");
            description = object.get_string_member("description");
            start_parameter = object.get_string_member("start_parameter");
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
        }
    }
}
