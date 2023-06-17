namespace Telegram {
    
    public class ShippingOption : Object, Serializable {
        public string id;
        public string title;
        public LabeledPrice[] prices;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            Serializable[] arr = {};
            foreach (var element in prices) {
                arr += element;
            }
            builder.set_member_name("prices");
            builder.add_value(Serializable.serialize_array(arr));
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
