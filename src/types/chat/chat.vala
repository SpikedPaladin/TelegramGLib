namespace Telegram {
    
    /**
     * This object represents a chat.
     */
    public class Chat : Object {
        /**
         * Unique identifier for this chat.
         */
        public ChatId id;
        /**
         * Type of chat, can be either “private”, “group”, “supergroup” or “channel”
         * @see Chat.Type
         */
        public Type type;
        /**
         * //Optional.//
         * Title, for supergroups, channels and group chats
         */
        public string? title;
        /**
         * //Optional.//
         * Username, for private chats, supergroups and channels if available
         */
        public string? username;
        /**
         * //Optional.//
         * First name of the other party in a private chat
         */
        public string? first_name;
        /**
         * //Optional.//
         * Last name of the other party in a private chat
         */
        public string? last_name;
        /**
         * //Optional.//
         * ''True'', if the supergroup chat is a forum
         */
        public bool is_forum;
        /**
         * //Optional.//
         * Chat photo.
         * Returned only in {@link Bot.get_chat}.
         */
        public ChatPhoto? photo;
        /**
         * //Optional.//
         * If non-empty, the list of all [[https://telegram.org/blog/topics-in-groups-collectible-usernames#collectible-usernames|active chat usernames]]; for private chats, supergroups and channels.
         * Returned only in {@link Bot.get_chat}.
         */
        public string[]? active_usernames;
        /**
         * //Optional.//
         * List of available reactions allowed in the chat.
         * If omitted, then all emoji reactions are allowed.
         * Returned only in {@link Bot.get_chat}.
         */
        public ReactionType[]? available_reactions;
        /**
         * //Optional.//
         * Identifier of the accent color for the chat name and backgrounds of the chat photo, reply header, and link preview.
         * See accent colors for more details.
         * Returned only in {@link Bot.get_chat}.
         * Always returned in {@link Bot.get_chat}. 
         */
        public int accent_color_id;
        /**
         * //Optional.//
         * Custom emoji identifier of emoji chosen by the chat for the reply header and link preview background.
         * Returned only in {@link Bot.get_chat}.
         */
        public string background_custom_emoji_id;
        /**
         * //Optional.//
         * Identifier of the accent color for the chat's profile background.
         * See profile accent colors for more details.
         * Returned only in {@link Bot.get_chat}.
         */
        public int profile_accent_color_id;
        /**
         * //Optional.//
         * Custom emoji identifier of the emoji chosen by the chat for its profile background.
         * Returned only in {@link Bot.get_chat}.
         */
        public string profile_background_custom_emoji_id;
        /**
         * //Optional.//
         * Custom emoji identifier of emoji status of the other party in a private chat.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? emoji_status_custom_emoji_id;
        /**
         * //Optional.//
         * Expiration date of the emoji status of the other party in a private chat in Unix time, if any.
         * Returned only in {@link Bot.get_chat}.
         */
        public int64? emoji_status_expiration_date;
        /**
         * //Optional.//
         * Bio of the other party in a private chat.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? bio;
        /**
         * //Optional.//
         * ''True'', if privacy settings of the other party in the private chat allows to use //tg:\/\/user?id=<user_id>// links only in chats with the user.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_private_forwards;
        /**
         * //Optional.//
         * ''True'', if the privacy settings of the other party restrict sending voice and video note messages in the private chat.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_restricted_voice_and_video_messages;
        /**
         * //Optional.//
         * ''True'', if users need to join the supergroup before they can send messages.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool join_to_send_messages;
        /**
         * //Optional.//
         * ''True'', if all users directly joining the supergroup need to be approved by supergroup administrators.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool join_by_request;
        /**
         * //Optional.//
         * Description, for groups, supergroups and channel chats.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? description;
        /**
         * //Optional.//
         * Primary invite link, for groups, supergroups and channel chats.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? invite_link;
        /**
         * //Optional.//
         * The most recent pinned message (by sending date).
         * Returned only in {@link Bot.get_chat}.
         */
        public Message? pinned_message;
        /**
         * //Optional.//
         * Default chat member permissions, for groups and supergroups.
         * Returned only in {@link Bot.get_chat}.
         */
        public ChatPermissions? permissions;
        /**
         * //Optional.//
         * For supergroups, the minimum allowed delay between consecutive messages sent by each unpriviledged user; in seconds.
         * Returned only in {@link Bot.get_chat}.
         */
        public int? slow_mode_delay;
        /**
         * //Optional.//
         * For supergroups, the minimum number of boosts that a non-administrator user needs to add in order to ignore slow mode and chat permissions.
         * Returned only in {@link Bot.get_chat}.
         */
        public int? unrestrict_boost_count;
        /**
         * //Optional.//
         * The time after which all messages sent to the chat will be automatically deleted; in seconds.
         * Returned only in {@link Bot.get_chat}.
         */
        public int? message_auto_delete_time;
        /**
         * //Optional.//
         * True, if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_aggressive_anti_spam_enabled;
        /**
         * //Optional.//
         * True, if non-administrators can only get the list of bots and administrators in the chat.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_hidden_members;
        /**
         * //Optional.//
         * True, if messages from the chat can't be forwarded to other chats.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_protected_content;
        /**
         * //Optional.//
         * True, if new chat members will have access to old messages; available only to chat administrators.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool has_visible_history;
        /**
         * //Optional.//
         * For supergroups, name of group sticker set.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? sticker_set_name;
        /**
         * //Optional.//
         * True, if the bot can change the group sticker set.
         * Returned only in {@link Bot.get_chat}.
         */
        public bool can_set_sticker_set;
        /**
         * //Optional.//
         * For supergroups, the name of the group's custom emoji sticker set.
         * Custom emoji from this set can be used by all users and bots in the group.
         * Returned only in {@link Bot.get_chat}.
         */
        public string? custom_emoji_sticker_set_name;
        /**
         * //Optional.//
         * Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats.
         * Returned only in {@link Bot.get_chat}.
         */
        public int64? linked_chat_id;
        /**
         * //Optional.//
         * For supergroups, the location to which the supergroup is connected.
         * Returned only in {@link Bot.get_chat}.
         */
        public ChatLocation? location;
        
        public Chat(Json.Object object) {
            id = ChatId.parse(object, "id");
            type = Type.parse(object.get_string_member("type"));
            
            if (object.has_member("title"))
                title = object.get_string_member("title");
            
            if (object.has_member("username"))
                username = object.get_string_member("username");
            
            if (object.has_member("first_name"))
                first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("is_forum"))
                is_forum = object.get_boolean_member("is_forum");
            
            if (object.has_member("photo"))
                photo = new ChatPhoto(object.get_object_member("photo"));
            
            if (object.has_member("active_usernames")) {
                string[] temp = {};
                
                foreach (var element in object.get_array_member("active_usernames").get_elements())
                    temp += element.get_string();
                
                active_usernames = temp;
            }
            
            if (object.has_member("available_reactions")) {
                ReactionType[] temp = {};
                
                foreach (var element in object.get_array_member("available_reactions").get_elements())
                    temp += ReactionType.from_json(element.get_object());
                
                available_reactions = temp;
            }
            
            if (object.has_member("accent_color_id"))
                accent_color_id = (int) object.get_int_member("accent_color_id");
            
            if (object.has_member("background_custom_emoji_id"))
                background_custom_emoji_id = object.get_string_member("background_custom_emoji_id");
            
            if (object.has_member("profile_accent_color_id"))
                profile_accent_color_id = (int) object.get_int_member("profile_accent_color_id");
            
            if (object.has_member("profile_background_custom_emoji_id"))
                profile_background_custom_emoji_id = object.get_string_member("profile_background_custom_emoji_id");
            
            if (object.has_member("emoji_status_custom_emoji_id"))
                emoji_status_custom_emoji_id = object.get_string_member("emoji_status_custom_emoji_id");
            
            if (object.has_member("emoji_status_expiration_date"))
                emoji_status_expiration_date = object.get_int_member("emoji_status_expiration_date");
            
            if (object.has_member("bio"))
                bio = object.get_string_member("bio");
            
            if (object.has_member("has_private_forwards"))
                has_private_forwards = object.get_boolean_member("has_private_forwards");
            
            if (object.has_member("has_restricted_voice_and_video_messages"))
                has_restricted_voice_and_video_messages = object.get_boolean_member("has_restricted_voice_and_video_messages");
            
            if (object.has_member("join_to_send_messages"))
                join_to_send_messages = object.get_boolean_member("join_to_send_messages");
            
            if (object.has_member("join_by_request"))
                join_by_request = object.get_boolean_member("join_by_request");
            
            if (object.has_member("description"))
                description = object.get_string_member("description");
            
            if (object.has_member("invite_link"))
                invite_link = object.get_string_member("invite_link");
            
            if (object.has_member("pinned_message"))
                pinned_message = new Message(object.get_object_member("pinned_message"));
            
            if (object.has_member("permissions"))
                permissions = new ChatPermissions(object.get_object_member("permissions"));
            
            if (object.has_member("slow_mode_delay"))
                slow_mode_delay = (int) object.get_int_member("slow_mode_delay");
            
            if (object.has_member("unrestrict_boost_count"))
                unrestrict_boost_count = (int) object.get_int_member("unrestrict_boost_count");
            
            if (object.has_member("message_auto_delete_time"))
                message_auto_delete_time = (int) object.get_int_member("message_auto_delete_time");
            
            if (object.has_member("has_aggressive_anti_spam_enabled"))
                has_aggressive_anti_spam_enabled = object.get_boolean_member("has_aggressive_anti_spam_enabled");
            
            if (object.has_member("has_hidden_members"))
                has_hidden_members = object.get_boolean_member("has_hidden_members");
            
            if (object.has_member("has_protected_content"))
                has_protected_content = object.get_boolean_member("has_protected_content");
            
            if (object.has_member("has_visible_history"))
                has_visible_history = object.get_boolean_member("has_visible_history");
            
            if (object.has_member("sticker_set_name"))
                sticker_set_name = object.get_string_member("sticker_set_name");
            
            if (object.has_member("can_set_sticker_set"))
                can_set_sticker_set = object.get_boolean_member("can_set_sticker_set");
            
            if (object.has_member("custom_emoji_sticker_set_name"))
                custom_emoji_sticker_set_name = object.get_string_member("custom_emoji_sticker_set_name");
            
            if (object.has_member("linked_chat_id"))
                linked_chat_id = object.get_int_member("linked_chat_id");
            
            if (object.has_member("location"))
                location = new ChatLocation(object.get_object_member("location"));
        }
        
        public enum Type {
            PRIVATE,
            GROUP,
            SUPERGROUP,
            CHANNEL,
            SENDER;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "private":
                        return PRIVATE;
                    case "group":
                        return GROUP;
                    case "supergroup":
                        return SUPERGROUP;
                    case "channel":
                        return CHANNEL;
                    case "sender":
                        return SENDER;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case PRIVATE:
                        return "private";
                    case GROUP:
                        return "group";
                    case SUPERGROUP:
                        return "supergroup";
                    case CHANNEL:
                        return "channel";
                    case SENDER:
                        return "sender";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
