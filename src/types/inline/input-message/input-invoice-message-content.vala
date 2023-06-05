namespace Telegram {
    
    public class InputInvoiceMessageContent : Object, Serializable, InputMessageContent {
        public string title;
        public string description;
        public string payload;
        public string provider_token;
        public string currency;
        public LabeledPrice[] prices;
        public int? max_tip_amount;
        public int[]? suggested_tip_amounts;
        public string? start_parameter;
        public string? provider_data;
        public string? photo_url;
        public int? photo_size;
        public int? photo_width;
        public int? photo_height;
        public bool? need_name;
        public bool? need_phone_number;
        public bool? need_email;
        public bool? need_shipping_address;
        public bool? send_phone_number_to_provider;
        public bool? send_email_to_provider;
        public bool? is_flexible;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("description");
            builder.add_string_value(description);
            
            builder.set_member_name("payload");
            builder.add_string_value(payload);
            
            builder.set_member_name("provider_token");
            builder.add_string_value(provider_token);
            
            builder.set_member_name("currency");
            builder.add_string_value(currency);
            
            Serializable[] arr = {};
            foreach (var element in prices) {
                arr += element;
            }
            builder.set_member_name("prices");
            builder.add_value(Serializable.serialize_array(arr));
            
            if (max_tip_amount != null) {
                builder.set_member_name("max_tip_amount");
                builder.add_int_value(max_tip_amount);
            }
            
            if (suggested_tip_amounts != null) {
                builder.set_member_name("suggested_tip_amounts");
                builder.begin_array();
                
                foreach (var element in suggested_tip_amounts)
                    builder.add_int_value(element);
                
                builder.end_array();
            }
            
            if (start_parameter != null) {
                builder.set_member_name("start_parameter");
                builder.add_string_value(start_parameter);
            }
            
            if (provider_data != null) {
                builder.set_member_name("provider_data");
                builder.add_string_value(provider_data);
            }
            
            if (photo_url != null) {
                builder.set_member_name("photo_url");
                builder.add_string_value(photo_url);
            }
            
            if (photo_size != null) {
                builder.set_member_name("photo_size");
                builder.add_int_value(photo_size);
            }
            
            if (photo_width != null) {
                builder.set_member_name("photo_width");
                builder.add_int_value(photo_width);
            }
            
            if (photo_height != null) {
                builder.set_member_name("photo_height");
                builder.add_int_value(photo_height);
            }
            
            if (need_name != null) {
                builder.set_member_name("need_name");
                builder.add_boolean_value(need_name);
            }
            
            if (need_phone_number != null) {
                builder.set_member_name("need_phone_number");
                builder.add_boolean_value(need_phone_number);
            }
            
            if (need_email != null) {
                builder.set_member_name("need_email");
                builder.add_boolean_value(need_email);
            }
            
            if (need_shipping_address != null) {
                builder.set_member_name("need_shipping_address");
                builder.add_boolean_value(need_shipping_address);
            }
            
            if (send_phone_number_to_provider != null) {
                builder.set_member_name("send_phone_number_to_provider");
                builder.add_boolean_value(send_phone_number_to_provider);
            }
            
            if (send_email_to_provider != null) {
                builder.set_member_name("send_email_to_provider");
                builder.add_boolean_value(send_email_to_provider);
            }
            
            if (is_flexible != null) {
                builder.set_member_name("is_flexible");
                builder.add_boolean_value(is_flexible);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
