namespace Telegram {
    
    public class InputLocationMessageContent : Object, Serializable, InputMessageContent {
        public double latitude;
        public double longitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            if (horizontal_accuracy != null) {
                builder.set_member_name("horizontal_accuracy");
                builder.add_double_value(horizontal_accuracy);
            }
            
            if (live_period != null) {
                builder.set_member_name("live_period");
                builder.add_int_value(live_period);
            }
            
            if (heading != null) {
                builder.set_member_name("heading");
                builder.add_int_value(heading);
            }
            
            if (proximity_alert_radius != null) {
                builder.set_member_name("proximity_alert_radius");
                builder.add_int_value(proximity_alert_radius);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
