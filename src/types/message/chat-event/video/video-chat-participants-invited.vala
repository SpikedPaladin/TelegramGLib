namespace Telegram.Types {
	
    public class VideoChatParticipantsInvited {
        public User[] users;
        
        public VideoChatParticipantsInvited(Json.Object object) {
            User[] temp = {};
            foreach (var element in object.get_array_member("users").get_elements())
                temp += new User(element.get_object());
            
            users = temp;
        }
    }
}
