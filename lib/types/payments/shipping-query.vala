namespace Telegram.Types {
	
    public class ShippingQuery {
        public string id;
        public User from;
        public string invoice_payload;
        public ShippingAddress shipping_address;
        
        public ShippingQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            invoice_payload = object.get_string_member("invoice_payload");
            shipping_address = new ShippingAddress(object.get_object_member("shipping_address"));
        }
    }
}
