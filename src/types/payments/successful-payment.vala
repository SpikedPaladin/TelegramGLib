namespace Telegram {
    
    public class SuccessfulPayment : Object {
        public string currency;
        public int total_amount;
        public string invoice_payload;
        public string? shipping_option_id;
        public OrderInfo? order_info;
        public string telegram_payment_charge_id;
        public string provider_payment_charge_id;
        
        public SuccessfulPayment(Json.Object object) {
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
            invoice_payload = object.get_string_member("invoice_payload");
            telegram_payment_charge_id = object.get_string_member("telegram_payment_charge_id");
            provider_payment_charge_id = object.get_string_member("provider_payment_charge_id");
            
            if (object.has_member("shipping_option_id"))
                shipping_option_id = object.get_string_member("shipping_option_id");
            
            if (object.has_member("order_info"))
                order_info = new OrderInfo(object.get_object_member("order_info"));
        }
    }
}
