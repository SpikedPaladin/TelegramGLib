namespace Telegram {
    
    public class MessageReactionUpdated : Object {
        public Chat chat;
        public int message_id;
        public User? user;
        public Chat? actor_chat;
        public int64 date;
        public ReactionType[] old_reaction;
        public ReactionType[] new_reaction;
        
        public MessageReactionUpdated(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
            {
                ReactionType[] temp = {};
                foreach (var element in object.get_array_member("old_reaction").get_elements()) {
                    var reaction = ReactionType.from_json(object);
                    if (reaction != null)
                        temp += reaction;
                }
                old_reaction = temp;
            }
            {
                ReactionType[] temp = {};
                foreach (var element in object.get_array_member("new_reaction").get_elements()) {
                    var reaction = ReactionType.from_json(object);
                    if (reaction != null)
                        temp += reaction;
                }
                new_reaction = temp;
            }
            
            if (object.has_member("user"))
                user = new User(object.get_object_member("user"));
            
            if (object.has_member("actor_chat"))
                actor_chat = new Chat(object.get_object_member("actor_chat"));
        }
    }
}