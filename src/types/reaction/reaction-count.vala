namespace Telegram {
    
    public class ReactionCount : Object {
        public ReactionType type;
        public int total_count;
        
        public ReactionCount(Json.Object object) {
            type = ReactionType.from_json(object);
            total_count = (int) object.get_int_member("total_count");
        }
    }
}