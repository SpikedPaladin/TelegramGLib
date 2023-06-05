namespace Telegram {
    
    public class ChatLocation {
        public Location location;
        public string address;
        
        public ChatLocation(Json.Object object) {
            location = new Location(object.get_object_member("location"));
            address = object.get_string_member("address");
        }
    }
}
