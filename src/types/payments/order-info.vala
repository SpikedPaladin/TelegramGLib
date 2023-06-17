namespace Telegram {
    
    public class OrderInfo : Object {
        public string? name;
        public string? phone_number;
        public string? email;
        public ShippingAddress? shipping_address;
        
        public OrderInfo(Json.Object object) {
            if (object.has_member("name"))
                name = object.get_string_member("name");
            
            if (object.has_member("phone_number"))
                phone_number = object.get_string_member("phone_number");
            
            if (object.has_member("email"))
                email = object.get_string_member("email");
            
            if (object.has_member("shipping_address"))
                shipping_address = new ShippingAddress(object.get_object_member("shipping_address"));
        }
    }
}
