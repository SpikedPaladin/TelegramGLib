namespace Telegram {
    
    public class MessageReactionCountUpdated : Object {
        public Chat chat;
        public int message_id;
        public int64 date;
        public ReactionType[] reactions;
        
        public MessageReactionCountUpdated(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
            
            ReactionType[] temp = {};
            foreach (var element in object.get_array_member("reactions").get_elements()) {
                var reaction = ReactionType.from_json(object);
                if (reaction != null)
                    temp += reaction;
            }
            reactions = temp;
        }
    }
}