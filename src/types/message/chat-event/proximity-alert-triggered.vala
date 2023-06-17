namespace Telegram {
    
    public class ProximityAlertTriggered : Object {
        public User traveler;
        public User watcher;
        public int distance;
        
        public ProximityAlertTriggered(Json.Object object) {
            traveler = new User(object.get_object_member("traveler"));
            watcher = new User(object.get_object_member("watcher"));
            distance = (int) object.get_int_member("distance");
        }
    }
}
