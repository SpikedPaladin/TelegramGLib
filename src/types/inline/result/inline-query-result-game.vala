namespace Telegram.Types {
	
    public class InlineQueryResultGame : Object, Serializable, InlineQueryResult {
        public string id;
        public string game_short_name;
        public InlineKeyboardMarkup? reply_markup;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("game");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("game_short_name");
            builder.add_string_value(game_short_name);
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
