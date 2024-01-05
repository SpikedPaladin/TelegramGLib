namespace Telegram {
    
    public class ReactionTypeEmoji : ReactionType, Serializable, Object {
        public Type type = Type.EMOJI;
        public string emoji;
        
        public ReactionTypeEmoji(Json.Object? object = null) {
            if (object != null)
                emoji = object.get_string_member("emoji");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("emoji");
            builder.add_string_value(emoji);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}