namespace Telegram.Types {
    
    /**
     * This object represents a Telegram user or bot.
     */
    public class User : Object, Serializable {
        /**
         * Unique identifier for this user or bot.
         */
        public int64 id;
        /**
         * ''True'', if this user is a bot
         */
        public bool is_bot;
        /**
         * User's or bot's first name
         */
        public string first_name;
        /**
         * //Optional.//
         * User's or bot's last name
         */
        public string? last_name;
        /**
         * //Optional.//
         * User's or bot's username
         */
        public string? username;
        /**
         * //Optional.//
         * [[https://en.wikipedia.org/wiki/IETF_language_tag|IETF language tag]] of the user's language
         */
        public string? language_code;
        /**
         * //Optional.//
         * ''True'', if this user is a Telegram Premium user
         */
        public bool is_premium;
        /**
         * //Optional.//
         * True, if this user added the bot to the attachment menu
         */
        public bool added_to_attachment_menu;
        /**
         * //Optional.//
         * True, if the bot can be invited to groups. Returned only in {@link Bot.get_me}.
         */
        public bool? can_join_groups;
        /**
         * //Optional.//
         * True, if privacy mode is disabled for the bot. Returned only in {@link Bot.get_me}.
         */
        public bool? can_read_all_group_messages;
        /**
         * //Optional.//
         * True, if the bot supports inline queries. Returned only in {@link Bot.get_me}.
         */
        public bool? supports_inline_queries;
        
        public User(Json.Object object) {
            id = object.get_int_member("id");
            is_bot = object.get_boolean_member("is_bot");
            first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("username"))
                username = object.get_string_member("username");
            
            if (object.has_member("language_code"))
                language_code = object.get_string_member("language_code");
            
            if (object.has_member("is_premium"))
                is_premium = object.get_boolean_member("is_premium");
            
            if (object.has_member("added_to_attachment_menu"))
                added_to_attachment_menu = object.get_boolean_member("added_to_attachment_menu");
            
            if (object.has_member("can_join_groups"))
                can_join_groups = object.get_boolean_member("can_join_groups");
            
            if (object.has_member("can_read_all_group_messages"))
                can_read_all_group_messages = object.get_boolean_member("can_read_all_group_messages");
            
            if (object.has_member("supports_inline_queries"))
                supports_inline_queries = object.get_boolean_member("supports_inline_queries");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.set_member_name("id");
            builder.add_int_value(id);
            
            builder.set_member_name("is_bot");
            builder.add_boolean_value(is_bot);
            
            builder.set_member_name("first_name");
            builder.add_string_value(first_name);
            
            if (last_name != null) {
                builder.set_member_name("last_name");
                builder.add_string_value(last_name);
            }
            
            if (username != null) {
                builder.set_member_name("username");
                builder.add_string_value(username);
            }
            
            if (language_code != null) {
                builder.set_member_name("language_code");
                builder.add_string_value(language_code);
            }
            
            if (is_premium) {
                builder.set_member_name("is_premium");
                builder.add_boolean_value(is_premium);
            }
            
            if (added_to_attachment_menu) {
                builder.set_member_name("added_to_attachment_menu");
                builder.add_boolean_value(added_to_attachment_menu);
            }
            
            if (can_join_groups != null) {
                builder.set_member_name("can_join_groups");
                builder.add_boolean_value(can_join_groups);
            }
            
            if (can_read_all_group_messages != null) {
                builder.set_member_name("can_read_all_group_messages");
                builder.add_boolean_value(can_read_all_group_messages);
            }
            
            if (supports_inline_queries != null) {
                builder.set_member_name("supports_inline_queries");
                builder.add_boolean_value(supports_inline_queries);
            }
            
            return builder.get_root();
        }
    }
}
