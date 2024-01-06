namespace Telegram {
    
    public class ReactionTypeCustomEmoji : Object, Serializable, ReactionType {
        public string custom_emoji_id;
        
        public ReactionTypeCustomEmoji(Json.Object? object = null) {
            if (object != null)
                custom_emoji_id = object.get_string_member("custom_emoji_id");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(Type.CUSTOM_EMOJI.to_string());
            
            builder.set_member_name("custom_emoji_id");
            builder.add_string_value(custom_emoji_id);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}