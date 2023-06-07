namespace Telegram {
    
    public class Location : Object {
        public double longitude;
        public double latitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        
        public Location(Json.Object object) {
            longitude = object.get_double_member("longitude");
            latitude = object.get_double_member("latitude");
            
            if (object.has_member("horizontal_accuracy"))
                horizontal_accuracy = object.get_double_member("horizontal_accuracy");
            
            if (object.has_member("live_period"))
                live_period = (int) object.get_int_member("live_period");
            
            if (object.has_member("heading"))
                heading = (int) object.get_int_member("heading");
            
            if (object.has_member("proximity_alert_radius"))
                proximity_alert_radius = (int) object.get_int_member("proximity_alert_radius");
        }
    }
}
