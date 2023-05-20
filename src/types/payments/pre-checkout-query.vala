namespace Telegram.Types {
	
    public class PreCheckoutQuery {
        public string id;
        public User from;
        public string currency;
        public int total_amount;
        public string invoice_payload;
        public string? shipping_option_id;
        public OrderInfo? order_info;
        
        public PreCheckoutQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
            invoice_payload = object.get_string_member("invoice_payload");
            
            if (object.has_member("shipping_option_id"))
                shipping_option_id = object.get_string_member("shipping_option_id");
            
            if (object.has_member("order_info"))
                order_info = new OrderInfo(object.get_object_member("order_info"));
        }
    }
}
