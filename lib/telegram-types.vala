using Gee;

[CCode (cprefix = "Telegram", lower_case_cprefix = "telegram_")]
namespace Telegram.Types {
    
    public class Response {
        public bool ok;
        public Json.Node? result;
        public string? description;
        public int? error_code;
        
        public Response(Json.Object object) {
            ok = object.get_boolean_member("ok");
            
            if (object.has_member("result"))
                result = object.get_member("result");
            
            if (object.has_member("description"))
                description = object.get_string_member("description");
            
            if (object.has_member("error_code"))
                error_code = (int) object.get_int_member("error_code");
        }
    }
    
    public class Update {
        public int update_id;
        public Message? message;
        public Message? edited_message;
        public Message? channel_post;
        public Message? edited_channel_post;
        public InlineQuery? inline_query;
        public ChosenInlineResult? chosen_inline_result;
        public CallbackQuery? callback_query;
        public ShippingQuery? shipping_query;
        public PreCheckoutQuery? pre_checkout_query;
        public Poll? poll;
        public Poll.Answer? poll_answer;
        public ChatMemberUpdated? my_chat_member;
        public ChatMemberUpdated? chat_member;
        
        public Update(Json.Object object) {
            update_id = (int) object.get_int_member("update_id");
            if (object.has_member("message"))
                message = new Message(object.get_object_member("message"));
            
            if (object.has_member("edited_message"))
                edited_message = new Message(object.get_object_member("edited_message"));
            
            if (object.has_member("channel_post"))
                channel_post = new Message(object.get_object_member("channel_post"));
            
            if (object.has_member("edited_channel_post"))
                edited_channel_post = new Message(object.get_object_member("edited_channel_post"));
            
            if (object.has_member("inline_query"))
                inline_query = new InlineQuery(object.get_object_member("inline_query"));
            
            if (object.has_member("chosen_inline_result"))
                chosen_inline_result = new ChosenInlineResult(object.get_object_member("chosen_inline_result"));
            
            if (object.has_member("callback_query"))
                callback_query = new CallbackQuery(object.get_object_member("callback_query"));
            
            if (object.has_member("shipping_query"))
                shipping_query = new ShippingQuery(object.get_object_member("shipping_query"));
            
            if (object.has_member("pre_checkout_query"))
                pre_checkout_query = new PreCheckoutQuery(object.get_object_member("pre_checkout_query"));
            
            if (object.has_member("poll"))
                poll = new Poll(object.get_object_member("poll"));
            
            if (object.has_member("poll_answer"))
                poll_answer = new Poll.Answer(object.get_object_member("poll_answer"));
            
            if (object.has_member("my_chat_member"))
                my_chat_member = new ChatMemberUpdated(object.get_object_member("my_chat_member"));
            
            if (object.has_member("chat_member"))
                chat_member = new ChatMemberUpdated(object.get_object_member("chat_member"));
        }
    }
    
    public class User : Object, Serializable {
        public int64 id;
        public bool is_bot;
        public string first_name;
        public string? last_name;
        public string? username;
        public string? language_code;
        public bool? can_join_groups;
        public bool? can_read_all_group_messages;
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
    
    public class Chat {
        public int64 id;
        public Type type;
        public string? title;
        public string? username;
        public string? first_name;
        public string? last_name;
        public ChatPhoto? photo;
        public string? bio;
        public string? description;
        public string? invite_link;
        public Message? pinned_message;
        public ChatPermissions? permissions;
        public int? slow_mode_delay;
        public int? message_auto_delete_time;
        public string? sticker_set_name;
        public bool? can_set_sticker_set;
        public int64? linked_chat_id;
        public ChatLocation? location;
        
        public Chat(Json.Object object) {
            id = object.get_int_member("id");
            type = Type.parse(object.get_string_member("type"));
            
            if (object.has_member("title"))
                title = object.get_string_member("title");
            
            if (object.has_member("username"))
                username = object.get_string_member("username");
            
            if (object.has_member("first_name"))
                first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("photo"))
                photo = new ChatPhoto(object.get_object_member("photo"));
            
            if (object.has_member("bio"))
                bio = object.get_string_member("bio");
            
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
            
            if (object.has_member("message_auto_delete_time"))
                message_auto_delete_time = (int) object.get_int_member("message_auto_delete_time");
            
            if (object.has_member("sticker_set_name"))
                sticker_set_name = object.get_string_member("sticker_set_name");
            
            if (object.has_member("can_set_sticker_set"))
                can_set_sticker_set = object.get_boolean_member("can_set_sticker_set");
            
            if (object.has_member("linked_chat_id"))
                linked_chat_id = object.get_int_member("linked_chat_id");
            
            if (object.has_member("location"))
                location = new ChatLocation(object.get_object_member("location"));
        }
        
        public enum Type {
            PRIVATE,
            GROUP,
            SUPERGROUP,
            CHANNEL;
            
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
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class Message {
        public int message_id;
        public User? from;
        public Chat? sender_chat;
        public int64 date;
        public Chat chat;
        public User? forward_from;
        public Chat? forward_from_chat;
        public int? forward_from_message_id;
        public string? forward_signature;
        public string? forward_sender_name;
        public int64? forward_date;
        public Message? reply_to_message;
        public User? via_bot;
        public int64? edit_date;
        public string? media_group_id;
        public string? author_signature;
        public string? text;
        public MessageEntity[]? entities;
        public Animation? animation;
        public Audio? audio;
        public Document? document;
        public PhotoSize[]? photo;
        public Sticker? sticker;
        public Video? video;
        public VideoNote? video_note;
        public Voice? voice;
        public string? caption;
        public MessageEntity[]? caption_entities;
        public Contact? contact;
        public Dice? dice;
        public Game? game;
        public Poll? poll;
        public Venue? venue;
        public Location? location;
        public User[]? new_chat_members;
        public User? left_chat_member;
        public string? new_chat_title;
        public PhotoSize[]? new_chat_photo;
        public bool delete_chat_photo;
        public bool group_chat_created;
        public bool supergroup_chat_created;
        public bool channel_chat_created;
        public MessageAutoDeleteTimerChanged? message_auto_delete_timer_changed;
        public int64? migrate_to_chat_id;
        public int64? migrate_from_chat_id;
        public Message? pinned_message;
        public Invoice? invoice;
        public SuccessfulPayment? successful_payment;
        public string? connected_website;
        public PassportData? passport_data;
        public ProximityAlertTriggered? proximity_alert_triggered;
        public VoiceChatScheduled? voice_chat_scheduled;
        public VoiceChatStarted? voice_chat_started;
        public VoiceChatEnded? voice_chat_ended;
        public VoiceChatParticipantsInvited? voice_chat_participants_invited;
        public InlineKeyboardMarkup? reply_markup;
        
        public Message(Json.Object object) {
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
            chat = new Chat(object.get_object_member("chat"));
            
            if (object.has_member("from"))
                from = new User(object.get_object_member("from"));
            
            if (object.has_member("sender_chat"))
                sender_chat = new Chat(object.get_object_member("sender_chat"));
            
            if (object.has_member("forward_from"))
                forward_from = new User(object.get_object_member("forward_from"));
            
            if (object.has_member("forward_from_chat"))
                forward_from_chat = new Chat(object.get_object_member("forward_from_chat"));
            
            if (object.has_member("forward_from_message_id"))
                forward_from_message_id = (int) object.get_int_member("forward_from_message_id");
            
            if (object.has_member("forward_signature"))
                forward_signature = object.get_string_member("forward_signature");
            
            if (object.has_member("forward_sender_name"))
                forward_sender_name = object.get_string_member("forward_sender_name");
            
            if (object.has_member("forward_date"))
                forward_date = object.get_int_member("forward_date");
            
            if (object.has_member("reply_to_message"))
                reply_to_message = new Message(object.get_object_member("reply_to_message"));
            
            if (object.has_member("via_bot"))
                via_bot = new User(object.get_object_member("via_bot"));
            
            if (object.has_member("edit_date"))
                edit_date = object.get_int_member("edit_date");
            
            if (object.has_member("media_group_id"))
                media_group_id = object.get_string_member("media_group_id");
            
            if (object.has_member("author_signature"))
                author_signature = object.get_string_member("author_signature");
            
            if (object.has_member("text"))
                text = object.get_string_member("text");
            
            if (object.has_member("entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                entities = temp;
            }
            
            if (object.has_member("animation"))
                animation = new Animation(object.get_object_member("animation"));
            
            if (object.has_member("audio"))
                audio = new Audio(object.get_object_member("audio"));
            
            if (object.has_member("document"))
                document = new Document(object.get_object_member("document"));
            
            if (object.has_member("photo")) {
                PhotoSize[] temp = {};
                foreach (var element in object.get_array_member("photo").get_elements()) {
                    temp += new PhotoSize(element.get_object());
                }
                photo = temp;
            }
            
            if (object.has_member("sticker"))
                sticker = new Sticker(object.get_object_member("sticker"));
            
            if (object.has_member("video"))
                video = new Video(object.get_object_member("video"));
            
            if (object.has_member("video_note"))
                video_note = new VideoNote(object.get_object_member("video_note"));
            
            if (object.has_member("voice"))
                voice = new Voice(object.get_object_member("voice"));
            
            if (object.has_member("caption"))
                caption = object.get_string_member("caption");
            
            if (object.has_member("caption_entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("caption_entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                caption_entities = temp;
            }
            
            if (object.has_member("contact"))
                contact = new Contact(object.get_object_member("contact"));
            
            if (object.has_member("dice"))
                dice = new Dice(object.get_object_member("dice"));
            
            if (object.has_member("game"))
                game = new Game(object.get_object_member("game"));
            
            if (object.has_member("poll"))
                poll = new Poll(object.get_object_member("poll"));
            
            if (object.has_member("venue"))
                venue = new Venue(object.get_object_member("venue"));
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
            
            if (object.has_member("new_chat_members")) {
                User[] temp = {};
                foreach (var element in object.get_array_member("new_chat_members").get_elements()) {
                    temp += new User(element.get_object());
                }
                new_chat_members = temp;
            }
            
            if (object.has_member("left_chat_member"))
                left_chat_member = new User(object.get_object_member("left_chat_member"));
            
            if (object.has_member("new_chat_title"))
                new_chat_title = object.get_string_member("new_chat_title");
            
            if (object.has_member("new_chat_photo")) {
                PhotoSize[] temp = {};
                foreach (var element in object.get_array_member("new_chat_photo").get_elements()) {
                    temp += new PhotoSize(element.get_object());
                }
                new_chat_photo = temp;
            }
            
            if (object.has_member("delete_chat_photo"))
                delete_chat_photo = true;
            
            if (object.has_member("group_chat_created"))
                group_chat_created = true;
            
            if (object.has_member("supergroup_chat_created"))
                supergroup_chat_created = true;
            
            if (object.has_member("channel_chat_created"))
                channel_chat_created = true;
            
            if (object.has_member("message_auto_delete_timer_changed"))
                message_auto_delete_timer_changed = new MessageAutoDeleteTimerChanged(object.get_object_member("message_auto_delete_timer_changed"));
            
            if (object.has_member("migrate_to_chat_id"))
                migrate_to_chat_id = object.get_int_member("migrate_to_chat_id");
            
            if (object.has_member("migrate_from_chat_id"))
                migrate_from_chat_id = object.get_int_member("migrate_from_chat_id");
            
            if (object.has_member("pinned_message"))
                pinned_message = new Message(object.get_object_member("pinned_message"));
            
            if (object.has_member("invoice"))
                invoice = new Invoice(object.get_object_member("invoice"));
            
            if (object.has_member("successful_payment"))
                successful_payment = new SuccessfulPayment(object.get_object_member("successful_payment"));
            
            if (object.has_member("connected_website"))
                connected_website = object.get_string_member("connected_website");
            
            if (object.has_member("passport_data"))
                passport_data = new PassportData(object.get_object_member("passport_data"));
            
            if (object.has_member("proximity_alert_triggered"))
                proximity_alert_triggered = new ProximityAlertTriggered(object.get_object_member("proximity_alert_triggered"));
            
            if (object.has_member("voice_chat_scheduled"))
                voice_chat_scheduled = new VoiceChatScheduled(object.get_object_member("voice_chat_scheduled"));
            
            if (object.has_member("voice_chat_started"))
                voice_chat_started = new VoiceChatStarted();
            
            if (object.has_member("voice_chat_ended"))
                voice_chat_ended = new VoiceChatEnded(object.get_object_member("voice_chat_ended"));
            
            if (object.has_member("voice_chat_participants_invited"))
                voice_chat_participants_invited = new VoiceChatParticipantsInvited(object.get_object_member("voice_chat_participants_invited"));
            
            if (object.has_member("reply_markup"))
                reply_markup = new InlineKeyboardMarkup(object.get_object_member("reply_markup"));
        }
        
        public bool is_command() {
            if (
	            entities != null &&
	            entities[0].offset == 0 &&
	            entities[0].type == MessageEntity.Type.BOT_COMMAND
	        ) {
	            return true;
	        }
	        return false;
        }
    }
    
    public class MessageId {
        public int message_id;
        
        public MessageId(Json.Object object) {
            message_id = (int) object.get_int_member("message_id");
        }
    }
    
    public class MessageEntity : Object, Serializable {
        public Type type;
        public int offset;
        public int length;
        public string? url;
        public User? user;
        public string? language;
        
        public MessageEntity(Json.Object? object = null) {
            if (object != null) {
                type = Type.parse(object.get_string_member("type"));
                offset = (int) object.get_int_member("offset");
                length = (int) object.get_int_member("length");
                
                if (object.has_member("url"))
                    url = object.get_string_member("url");
                
                if (object.has_member("user"))
                    user = new User(object.get_object_member("user"));
                
                if (object.has_member("language"))
                    language = object.get_string_member("language");
            }
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("offset");
            builder.add_int_value(offset);
            
            builder.set_member_name("length");
            builder.add_int_value(length);
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (user != null) {
                builder.set_member_name("user");
                builder.add_value(user.serialize());
            }
            
            if (language != null) {
                builder.set_member_name("language");
                builder.add_string_value(language);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public enum Type {
            MENTION,
            HASHTAG,
            CASHTAG,
            BOT_COMMAND,
            URL,
            EMAIL,
            PHONE_NUMBER,
            BOLD,
            ITALIC,
            UNDERLINE,
            STRIKETHROUGH,
            CODE,
            PRE,
            TEXT_LINK,
            TEXT_MENTION;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "mention":
                        return MENTION;
                    case "hashtag":
                        return HASHTAG;
                    case "cashtag":
                        return CASHTAG;
                    case "bot_command":
                        return BOT_COMMAND;
                    case "url":
                        return URL;
                    case "email":
                        return EMAIL;
                    case "phone_number":
                        return PHONE_NUMBER;
                    case "bold":
                        return BOLD;
                    case "italic":
                        return ITALIC;
                    case "underline":
                        return UNDERLINE;
                    case "strikethrough":
                        return STRIKETHROUGH;
                    case "code":
                        return CODE;
                    case "pre":
                        return PRE;
                    case "text_link":
                        return TEXT_LINK;
                    case "text_mention":
                        return TEXT_MENTION;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case MENTION:
                        return "mention";
                    case HASHTAG:
                        return "hashtag";
                    case CASHTAG:
                        return "cashtag";
                    case BOT_COMMAND:
                        return "bot_command";
                    case URL:
                        return "url";
                    case EMAIL:
                        return "email";
                    case PHONE_NUMBER:
                        return "phone_number";
                    case BOLD:
                        return "bold";
                    case ITALIC:
                        return "italic";
                    case UNDERLINE:
                        return "underline";
                    case STRIKETHROUGH:
                        return "strikethrough";
                    case CODE:
                        return "code";
                    case PRE:
                        return "pre";
                    case TEXT_LINK:
                        return "text_link";
                    case TEXT_MENTION:
                        return "text_mention";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class MessageAutoDeleteTimerChanged {
        public int message_auto_delete_time;
        
        public MessageAutoDeleteTimerChanged(Json.Object object) {
            message_auto_delete_time = (int) object.get_int_member("message_auto_delete_time");
        }
    }
    
    public class Animation {
        public string file_id;
        public string file_unique_id;
        public int width;
        public int height;
        public int duration;
        public PhotoSize? thumb;
        public string? file_name;
        public string? mime_type;
        public int? file_size;
        
        public Animation(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
            
            if (object.has_member("file_name"))
                file_name = object.get_string_member("file_name");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class Audio {
        public string file_id;
        public string file_unique_id;
        public int duration;
        public string? performer;
        public string? title;
        public string? file_name;
        public string? mime_type;
        public int? file_size;
        public PhotoSize? thumb;
        
        public Audio(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("performer"))
                performer = object.get_string_member("performer");
            
            if (object.has_member("title"))
                title = object.get_string_member("title");
            
            if (object.has_member("file_name"))
                file_name = object.get_string_member("file_name");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
        }
    }
    
    public class Document {
        public string file_id;
        public string file_unique_id;
        public PhotoSize? thumb;
        public string? file_name;
        public string? mime_type;
        public int? file_size;
        
        public Document(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
            
            if (object.has_member("file_name"))
                file_name = object.get_string_member("file_name");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class Video {
        public string file_id;
        public string file_unique_id;
        public int width;
        public int height;
        public int duration;
        public PhotoSize? thumb;
        public string? file_name;
        public string? mime_type;
        public int? file_size;
        
        public Video(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
            
            if (object.has_member("file_name"))
                file_name = object.get_string_member("file_name");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class VideoNote {
        public string file_id;
        public string file_unique_id;
        public int length;
        public int duration;
        public PhotoSize? thumb;
        public int? file_size;
        
        public VideoNote(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            length = (int) object.get_int_member("length");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class Voice {
        public string file_id;
        public string file_unique_id;
        public int duration;
        public string? mime_type;
        public int? file_size;
        
        public Voice(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            duration = (int) object.get_int_member("duration");
            
            if (object.has_member("mime_type"))
                mime_type = object.get_string_member("mime_type");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class Contact {
        public string phone_number;
        public string first_name;
        public string? last_name;
        public int64? user_id;
        public string? vcard;
        
        public Contact(Json.Object object) {
            phone_number = object.get_string_member("phone_number");
            first_name = object.get_string_member("first_name");
            
            if (object.has_member("last_name"))
                last_name = object.get_string_member("last_name");
            
            if (object.has_member("user_id"))
                user_id = object.get_int_member("user_id");
            
            if (object.has_member("vcard"))
                vcard = object.get_string_member("vcard");
        }
    }
    
    public class Game {
        public string title;
        public string description;
        public PhotoSize[] photo;
        public string? text;
        public MessageEntity[]? text_entities;
        public Animation? animation;
        
        public Game(Json.Object object) {
            title = object.get_string_member("title");
            description = object.get_string_member("description");
            
            PhotoSize[] temp_photo = {};
            foreach (var element in object.get_array_member("photo").get_elements()) {
                temp_photo += new PhotoSize(element.get_object());
            }
            photo = temp_photo;
            
            if (object.has_member("text"))
                text = object.get_string_member("text");
            
            if (object.has_member("text_entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("text_entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                text_entities = temp;
            }
            
            if (object.has_member("animation"))
                animation = new Animation(object.get_object_member("animation"));
        }
    }
    
    public class Dice {
        public string emoji;
        public int @value;
        
        public Dice(Json.Object object) {
            emoji = object.get_string_member("emoji");
            @value = (int) object.get_int_member("value");
        }
    }
    
    public class Poll {
        public string id;
        public string question;
        public Option[] options;
        public int total_voter_count;
        public bool is_closed;
        public bool is_anonymous;
        public Type type;
        public bool allows_multiple_answers;
        public int? correct_option_id;
        public string? explanation;
        public MessageEntity[]? explanation_entities;
        public int? open_period;
        public int64? close_date;
        
        public Poll(Json.Object object) {
            id = object.get_string_member("id");
            question = object.get_string_member("question");
            
            Option[] temp_options = {};
            foreach (var element in object.get_array_member("options").get_elements()) {
                temp_options += new Option(element.get_object());
            }
            options = temp_options;
            
            total_voter_count = (int) object.get_int_member("total_voter_count");
            is_closed = object.get_boolean_member("is_closed");
            is_anonymous = object.get_boolean_member("is_anonymous");
            type = Type.parse(object.get_string_member("type"));
            allows_multiple_answers = object.get_boolean_member("allows_multiple_answers");
            
            if (object.has_member("correct_option_id"))
                correct_option_id = (int) object.get_int_member("correct_option_id");
            
            if (object.has_member("explanation"))
                explanation = object.get_string_member("explanation");
            
            if (object.has_member("explanation_entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                explanation_entities = temp;
            }
            
            if (object.has_member("open_period"))
                open_period = (int) object.get_int_member("open_period");
            
            if (object.has_member("close_date"))
                close_date = object.get_int_member("close_date");
        }
        
        public class Answer {
            public string poll_id;
            public User user;
            public int[] option_ids;
            
            public Answer(Json.Object object) {
                poll_id = object.get_string_member("poll_id");
                user = new User(object.get_object_member("user"));
                
                int[] temp_option_ids = {};
                foreach (var element in object.get_array_member("option_ids").get_elements()) {
                    temp_option_ids += (int) element.get_int();
                }
                option_ids = temp_option_ids;
            }
        }
        
        public class Option {
            public string text;
            public int voter_count;
            
            public Option(Json.Object object) {
                text = object.get_string_member("text");
                voter_count = (int) object.get_int_member("voter_count");
            }
        }
        
        public enum Type {
            REGULAR,
            QUIZ;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "private":
                        return REGULAR;
                    case "group":
                        return QUIZ;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case REGULAR:
                        return "regular";
                    case QUIZ:
                        return "quiz";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class LabeledPrice : Object, Serializable {
        public string label;
        public int amount;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("label");
            builder.add_string_value(label);
            
            builder.set_member_name("amount");
            builder.add_int_value(amount);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class Invoice {
        public string title;
        public string description;
        public string start_parameter;
        public string currency;
        public int total_amount;
        
        public Invoice(Json.Object object) {
            title = object.get_string_member("title");
            description = object.get_string_member("description");
            start_parameter = object.get_string_member("start_parameter");
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
        }
    }
    
    public class SuccessfulPayment {
        public string currency;
        public int total_amount;
        public string invoice_payload;
        public string? shipping_option_id;
        public OrderInfo? order_info;
        public string telegram_payment_charge_id;
        public string provider_payment_charge_id;
        
        public SuccessfulPayment(Json.Object object) {
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
            invoice_payload = object.get_string_member("invoice_payload");
            telegram_payment_charge_id = object.get_string_member("telegram_payment_charge_id");
            provider_payment_charge_id = object.get_string_member("provider_payment_charge_id");
            
            if (object.has_member("shipping_option_id"))
                shipping_option_id = object.get_string_member("shipping_option_id");
            
            if (object.has_member("order_info"))
                order_info = new OrderInfo(object.get_object_member("order_info"));
        }
    }
    
    public class OrderInfo {
        public string? name;
        public string? phone_number;
        public string? email;
        public ShippingAddress? shipping_address;
        
        public OrderInfo(Json.Object object) {
            if (object.has_member("name"))
                name = object.get_string_member("name");
            
            if (object.has_member("phone_number"))
                phone_number = object.get_string_member("phone_number");
            
            if (object.has_member("email"))
                email = object.get_string_member("email");
            
            if (object.has_member("shipping_address"))
                shipping_address = new ShippingAddress(object.get_object_member("shipping_address"));
        }
    }
    
    public class ShippingAddress {
        public string country_code;
        public string state;
        public string city;
        public string street_line1;
        public string street_line2;
        public string post_code;
        
        public ShippingAddress(Json.Object object) {
            country_code = object.get_string_member("country_code");
            state = object.get_string_member("state");
            city = object.get_string_member("city");
            street_line1 = object.get_string_member("street_line1");
            street_line2 = object.get_string_member("street_line1");
            post_code = object.get_string_member("post_code");
        }
    }
    
    public class Sticker {
        public string file_id;
        public string file_unique_id;
        public int width;
        public int height;
        public bool is_animated;
        public PhotoSize? thumb;
        public string? emoji;
        public string? set_name;
        public MaskPosition? mask_position;
        public int? file_size;
        
        public Sticker(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            is_animated = object.get_boolean_member("is_animated");
            
            if (object.has_member("thumb"))
                thumb = new PhotoSize(object.get_object_member("thumb"));
            
            if (object.has_member("emoji"))
                emoji = object.get_string_member("emoji");
            
            if (object.has_member("set_name"))
                set_name = object.get_string_member("set_name");
            
            if (object.has_member("mask_position"))
                mask_position = new MaskPosition(object.get_object_member("mask_position"));
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class MaskPosition {
        public string point;
        public double x_shift;
        public double y_shift;
        public double scale;
        
        public MaskPosition(Json.Object object) {
            point = object.get_string_member("point");
            x_shift = object.get_double_member("x_shift");
            y_shift = object.get_double_member("y_shift");
            scale = object.get_double_member("scale");
        }
    }
    
    public class PhotoSize {
        public string file_id;
        public string file_unique_id;
        public int width;
        public int height;
        public int? file_size;
        
        public PhotoSize(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            width = (int) object.get_int_member("width");
            height = (int) object.get_int_member("height");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
        }
    }
    
    public class LoginUrl : Object, Serializable {
        public string url;
        public string? forward_text;
        public string? bot_username;
        public bool? request_write_access;
        
        public LoginUrl(Json.Object object) {
            url = object.get_string_member("url");
            
            if (object.has_member("forward_text"))
                forward_text = object.get_string_member("forward_text");
            
            if (object.has_member("bot_username"))
                bot_username = object.get_string_member("bot_username");
            
            if (object.has_member("request_write_access"))
                request_write_access = object.get_boolean_member("request_write_access");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.set_member_name("url");
            builder.add_string_value(url);
            
            if (forward_text != null) {
                builder.set_member_name("forward_text");
                builder.add_string_value(forward_text);
            }
            
            if (bot_username != null) {
                builder.set_member_name("bot_username");
                builder.add_string_value(bot_username);
            }
            
            if (request_write_access != null) {
                builder.set_member_name("request_write_access");
                builder.add_boolean_value(request_write_access);
            }
            
            return builder.get_root();
        }
    }
    
    public class InlineQuery {
        public string id;
        public User from;
        public string query;
        public string offset;
        public Chat.Type chat_type;
        public Location? location;
        
        public InlineQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            query = object.get_string_member("query");
            offset = object.get_string_member("offset");
            
            if (object.has_member("chat_type"))
                chat_type = Chat.Type.parse(object.get_string_member("chat_type"));
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
        }
    }
    
    public class ChosenInlineResult {
        public string result_id;
        public User from;
        public Location? location;
        public string? inline_message_id;
        public string query;
        
        public ChosenInlineResult(Json.Object object) {
            result_id = object.get_string_member("result_id");
            from = new User(object.get_object_member("from"));
            query = object.get_string_member("query");
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
            
            if (object.has_member("inline_message_id"))
                inline_message_id = object.get_string_member("inline_message_id");
        }
    }
    
    public class CallbackQuery {
        public string id;
        public User from;
        public Message? message;
        public string? inline_message_id;
        public string chat_instance;
        public string? data;
        public string? game_short_name;
        
        public CallbackQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            chat_instance = object.get_string_member("chat_instance");
            
            if (object.has_member("message"))
                message = new Message(object.get_object_member("message"));
            
            if (object.has_member("inline_message_id"))
                inline_message_id = object.get_string_member("inline_message_id");
            
            if (object.has_member("data"))
                data = object.get_string_member("data");
            
            if (object.has_member("game_short_name"))
                game_short_name = object.get_string_member("game_short_name");
        }
    }
    
    public class ShippingQuery {
        public string id;
        public User from;
        public string invoice_payload;
        public ShippingAddress shipping_address;
        
        public ShippingQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            invoice_payload = object.get_string_member("invoice_payload");
            shipping_address = new ShippingAddress(object.get_object_member("shipping_address"));
        }
    }
    
    public class PreCheckoutQuery {
        public string id;
        public User from;
        public string currency;
        public int total_amount;
        public string invoice_payload;
        public string? shipping_option_id;
        public OrderInfo? order_info;
        
        public PreCheckoutQuery(Json.Object object) {
            id = object.get_string_member("id");
            from = new User(object.get_object_member("from"));
            currency = object.get_string_member("currency");
            total_amount = (int) object.get_int_member("total_amount");
            invoice_payload = object.get_string_member("invoice_payload");
            
            if (object.has_member("shipping_option_id"))
                shipping_option_id = object.get_string_member("shipping_option_id");
            
            if (object.has_member("order_info"))
                order_info = new OrderInfo(object.get_object_member("order_info"));
        }
    }
    
    public class CallbackGame {}
    
    public class VoiceChatScheduled {
        public int64 start_date;
        
        public VoiceChatScheduled(Json.Object object) {
            start_date = object.get_int_member("start_date");
        }
    }
    
    public class VoiceChatStarted {}
    
    public class VoiceChatEnded {
        public int duration;
        
        public VoiceChatEnded(Json.Object object) {
            duration = (int) object.get_int_member("duration");
        }
    }
    
    public class VoiceChatParticipantsInvited {
        public User[] users;
        
        public VoiceChatParticipantsInvited(Json.Object object) {
            User[] temp_users = {};
            foreach (var element in object.get_array_member("users").get_elements()) {
                temp_users += new User(element.get_object());
            }
            users = temp_users;
        }
    }
    
    public class UserProfilePhotos {
        public int total_count;
        public ArrayList<ArrayList<PhotoSize>> photos;
        
        public UserProfilePhotos(Json.Object object) {
            total_count = (int) object.get_int_member("total_count");
            
            photos = new ArrayList<ArrayList<PhotoSize>>();
            foreach (var array in object.get_array_member("photos").get_elements()) {
                photos.add(new ArrayList<PhotoSize>());
                
                foreach (var photo in array.get_array().get_elements()) {
                    photos.get(photos.size - 1).add(new PhotoSize(photo.get_object()));
                }
            }
        }
    }
    
    public class TelegramFile {
        public string file_id;
        public string file_unique_id;
        public int? file_size;
        public string? file_path;
        
        public TelegramFile(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            
            if (object.has_member("file_size"))
                file_size = (int) object.get_int_member("file_size");
            
            if (object.has_member("file_path"))
                file_path = object.get_string_member("file_path");
        }
    }
    
    public class Location {
        public double longitude;
        public double latitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        
        public Location(Json.Object object) {
            longitude = object.get_double_member("longitude");
            latitude = object.get_double_member("latitude");
            
            if (object.has_member("horizontal_accuracy"))
                horizontal_accuracy = object.get_double_member("horizontal_accuracy");
            
            if (object.has_member("live_period"))
                live_period = (int) object.get_int_member("live_period");
            
            if (object.has_member("heading"))
                heading = (int) object.get_int_member("heading");
            
            if (object.has_member("proximity_alert_radius"))
                proximity_alert_radius = (int) object.get_int_member("proximity_alert_radius");
        }
    }
    
    public class Venue {
        public Location location;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        
        public Venue(Json.Object object) {
            location = new Location(object.get_object_member("location"));
            title = object.get_string_member("title");
            address = object.get_string_member("address");
            
            if (object.has_member("foursquare_id"))
                foursquare_id = object.get_string_member("foursquare_id");
            
            if (object.has_member("inline_message_id"))
                foursquare_type = object.get_string_member("foursquare_type");
            
            if (object.has_member("google_place_id"))
                google_place_id = object.get_string_member("google_place_id");
            
            if (object.has_member("google_place_type"))
                google_place_type = object.get_string_member("google_place_type");
        }
    }
    
    public class ProximityAlertTriggered {
        public User traveler;
        public User watcher;
        public int distance;
        
        public ProximityAlertTriggered(Json.Object object) {
            traveler = new User(object.get_object_member("traveler"));
            watcher = new User(object.get_object_member("watcher"));
            distance = (int) object.get_int_member("distance");
        }
    }
    
    public class ChatPhoto {
        public string small_file_id;
        public string small_file_unique_id;
        public string big_file_id;
        public string big_file_unique_id;
        
        public ChatPhoto(Json.Object object) {
            small_file_id = object.get_string_member("small_file_id");
            small_file_unique_id = object.get_string_member("small_file_unique_id");
            big_file_id = object.get_string_member("big_file_id");
            big_file_unique_id = object.get_string_member("big_file_unique_id");
        }
    }
    
    public class ChatInviteLink {
        public string invite_link;
        public User creator;
        public bool is_primary;
        public bool is_revoked;
        public int64? expire_date;
        public int? member_limit;
        
        public ChatInviteLink(Json.Object object) {
            invite_link = object.get_string_member("invite_link");
            creator = new User(object.get_object_member("creator"));
            is_primary = object.get_boolean_member("is_primary");
            is_revoked = object.get_boolean_member("is_revoked");
            
            if (object.has_member("expire_date"))
                expire_date = object.get_int_member("expire_date");
            
            if (object.has_member("member_limit"))
                member_limit = (int) object.get_int_member("member_limit");
        }
    }
    
    public class ChatMember {
        public User user;
        public Status status;
        public string? custom_title;
        public bool? is_anonymous;
        public bool? can_be_edited;
        public bool? can_manage_chat;
        public bool? can_post_messages;
        public bool? can_edit_messages;
        public bool? can_delete_messages;
        public bool? can_manage_voice_chats;
        public bool? can_restrict_members;
        public bool? can_promote_members;
        public bool? can_change_info;
        public bool? can_invite_users;
        public bool? can_pin_messages;
        public bool? is_member;
        public bool? can_send_messages;
        public bool? can_send_media_messages;
        public bool? can_send_polls;
        public bool? can_send_other_messages;
        public bool? can_add_web_page_previews;
        public int64? until_date;
        
        public ChatMember(Json.Object object) {
            user = new User(object.get_object_member("user"));
            status = Status.parse(object.get_string_member("status"));
            
            if (object.has_member("custom_title"))
                custom_title = object.get_string_member("custom_title");
            
            if (object.has_member("is_anonymous"))
                is_anonymous = object.get_boolean_member("is_anonymous");
            
            if (object.has_member("can_be_edited"))
                can_be_edited = object.get_boolean_member("can_be_edited");
            
            if (object.has_member("can_manage_chat"))
                can_manage_chat = object.get_boolean_member("can_manage_chat");
            
            if (object.has_member("can_post_messages"))
                can_post_messages = object.get_boolean_member("can_post_messages");
            
            if (object.has_member("can_edit_messages"))
                can_edit_messages = object.get_boolean_member("can_edit_messages");
            
            if (object.has_member("can_delete_messages"))
                can_delete_messages = object.get_boolean_member("can_delete_messages");
            
            if (object.has_member("can_manage_voice_chats"))
                can_manage_voice_chats = object.get_boolean_member("can_manage_voice_chats");
            
            if (object.has_member("can_restrict_members"))
                can_restrict_members = object.get_boolean_member("can_restrict_members");
            
            if (object.has_member("can_promote_members"))
                can_promote_members = object.get_boolean_member("can_promote_members");
            
            if (object.has_member("can_change_info"))
                can_change_info = object.get_boolean_member("can_change_info");
            
            if (object.has_member("can_invite_users"))
                can_invite_users = object.get_boolean_member("can_invite_users");
            
            if (object.has_member("can_pin_messages"))
                can_pin_messages = object.get_boolean_member("can_pin_messages");
            
            if (object.has_member("is_member"))
                is_member = object.get_boolean_member("is_member");
            
            if (object.has_member("can_send_messages"))
                can_send_messages = object.get_boolean_member("can_send_messages");
            
            if (object.has_member("can_send_media_messages"))
                can_send_media_messages = object.get_boolean_member("can_send_media_messages");
            
            if (object.has_member("can_send_polls"))
                can_send_polls = object.get_boolean_member("can_send_polls");
            
            if (object.has_member("can_send_other_messages"))
                can_send_other_messages = object.get_boolean_member("can_send_other_messages");
            
            if (object.has_member("can_add_web_page_previews"))
                can_add_web_page_previews = object.get_boolean_member("can_add_web_page_previews");
            
            if (object.has_member("until_date"))
                until_date = object.get_int_member("until_date");
        }
        
        public enum Status {
            CREATOR,
            ADMINISTRATOR,
            MEMBER,
            RESTRICTED,
            LEFT,
            KICKED;
            
            public static Status? parse(string status) {
                switch (status) {
                    case "creator":
                        return CREATOR;
                    case "administrator":
                        return ADMINISTRATOR;
                    case "member":
                        return MEMBER;
                    case "restricted":
                        return RESTRICTED;
                    case "left":
                        return LEFT;
                    case "kicked":
                        return KICKED;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case CREATOR:
                        return "creator";
                    case ADMINISTRATOR:
                        return "administrator";
                    case MEMBER:
                        return "member";
                    case RESTRICTED:
                        return "restricted";
                    case LEFT:
                        return "left";
                    case KICKED:
                        return "kicked";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class ChatMemberUpdated {
        public Chat chat;
        public User from;
        public int64 date;
        public ChatMember old_chat_member;
        public ChatMember new_chat_member;
        public ChatInviteLink? invite_link;
        
        public ChatMemberUpdated(Json.Object object) {
            chat = new Chat(object.get_object_member("chat"));
            from = new User(object.get_object_member("from"));
            date = object.get_int_member("date");
            old_chat_member = new ChatMember(object.get_object_member("old_chat_member"));
            new_chat_member = new ChatMember(object.get_object_member("new_chat_member"));
            
            if (object.has_member("invite_link"))
                invite_link = new ChatInviteLink(object.get_object_member("invite_link"));
        }
    }
    
    public class ChatPermissions : Object, Serializable {
        public bool? can_send_messages;
        public bool? can_send_media_messages;
        public bool? can_send_polls;
        public bool? can_send_other_messages;
        public bool? can_add_web_page_previews;
        public bool? can_change_info;
        public bool? can_invite_users;
        public bool? can_pin_messages;
        
        public ChatPermissions(Json.Object object) {
            if (object.has_member("can_send_messages"))
                can_send_messages = object.get_boolean_member("can_send_messages");
            
            if (object.has_member("can_send_media_messages"))
                can_send_media_messages = object.get_boolean_member("can_send_media_messages");
            
            if (object.has_member("can_send_polls"))
                can_send_polls = object.get_boolean_member("can_send_polls");
            
            if (object.has_member("can_send_other_messages"))
                can_send_other_messages = object.get_boolean_member("can_send_other_messages");
            
            if (object.has_member("can_add_web_page_previews"))
                can_add_web_page_previews = object.get_boolean_member("can_add_web_page_previews");
            
            if (object.has_member("can_change_info"))
                can_change_info = object.get_boolean_member("can_change_info");
            
            if (object.has_member("can_invite_users"))
                can_invite_users = object.get_boolean_member("can_invite_users");
            
            if (object.has_member("can_pin_messages"))
                can_pin_messages = object.get_boolean_member("can_pin_messages");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            if (can_send_messages != null) {
                builder.set_member_name("can_send_messages");
                builder.add_boolean_value(can_send_messages);
            }
            
            if (can_send_media_messages != null) {
                builder.set_member_name("can_send_media_messages");
                builder.add_boolean_value(can_send_media_messages);
            }
            
            if (can_send_polls != null) {
                builder.set_member_name("can_send_polls");
                builder.add_boolean_value(can_send_polls);
            }
            
            if (can_send_other_messages != null) {
                builder.set_member_name("can_send_other_messages");
                builder.add_boolean_value(can_send_other_messages);
            }
            
            if (can_add_web_page_previews != null) {
                builder.set_member_name("can_add_web_page_previews");
                builder.add_boolean_value(can_add_web_page_previews);
            }
            
            if (can_change_info != null) {
                builder.set_member_name("can_change_info");
                builder.add_boolean_value(can_change_info);
            }
            
            if (can_invite_users != null) {
                builder.set_member_name("can_invite_users");
                builder.add_boolean_value(can_invite_users);
            }
            
            if (can_pin_messages != null) {
                builder.set_member_name("can_pin_messages");
                builder.add_boolean_value(can_pin_messages);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class ChatLocation {
        public Location location;
        public string address;
        
        public ChatLocation(Json.Object object) {
            location = new Location(object.get_object_member("location"));
            address = object.get_string_member("address");
        }
    }
    
    public class BotCommand : Object, Serializable {
        public string command;
        public string description;
        
        public BotCommand(Json.Object object) {
            command = object.get_string_member("command");
            description = object.get_string_member("description");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("command");
            builder.add_string_value(command);
            
            builder.set_member_name("description");
            builder.add_string_value(description);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class PassportData {
        public EncryptedPassportElement[] data;
        public EncryptedCredentials credentials;
        
        public PassportData(Json.Object object) {
            EncryptedPassportElement[] temp_data = {};
            foreach (var element in object.get_array_member("data").get_elements()) {
                temp_data += new EncryptedPassportElement(element.get_object());
            }
            data = temp_data;
            
            credentials = new EncryptedCredentials(object.get_object_member("credentials"));
        }
    }
    
    public class PassportFile {
        public string file_id;
        public string file_unique_id;
        public int file_size;
        public int64 file_date;
        
        public PassportFile(Json.Object object) {
            file_id = object.get_string_member("file_id");
            file_unique_id = object.get_string_member("file_unique_id");
            file_size = (int) object.get_int_member("file_size");
            file_date = object.get_int_member("file_date");
        }
    }
    
    public class EncryptedPassportElement {
        public Type type;
        public string? data;
        public string? phone_number;
        public string? email;
        public PassportFile[]? files;
        public PassportFile? front_side;
        public PassportFile? reverse_side;
        public PassportFile? selfie;
        public PassportFile[]? translation;
        public string hash;
        
        public EncryptedPassportElement(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            hash = object.get_string_member("hash");
            
            if (object.has_member("data"))
                data = object.get_string_member("data");
            
            if (object.has_member("phone_number"))
                phone_number = object.get_string_member("phone_number");
            
            if (object.has_member("email"))
                email = object.get_string_member("email");
            
            if (object.has_member("files")) {
                PassportFile[] temp = {};
                foreach (var element in object.get_array_member("files").get_elements()) {
                    temp += new PassportFile(element.get_object());
                }
                files = temp;
            }
            
            if (object.has_member("front_side"))
                front_side = new PassportFile(object.get_object_member("front_side"));
            
            if (object.has_member("reverse_side"))
                reverse_side = new PassportFile(object.get_object_member("reverse_side"));
            
            if (object.has_member("selfie"))
                selfie = new PassportFile(object.get_object_member("selfie"));
            
            if (object.has_member("translation")) {
                PassportFile[] temp = {};
                foreach (var element in object.get_array_member("translation").get_elements()) {
                    temp += new PassportFile(element.get_object());
                }
                translation = temp;
            }
        }
        
        public enum Type {
            PERSONAL_DETAILS,
            PASSPORT,
            DRIVER_LICENSE,
            IDENTITY_CARD,
            INTERNAL_PASSPORT,
            ADDRESS,
            UTILITY_BILL,
            BANK_STATEMENT,
            RENTAL_AGREEMENT,
            PASSPORT_REGISTRATION,
            TEMPORARY_REGISTRATION,
            PHONE_NUMBER,
            EMAIL;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "personal_details":
                        return PERSONAL_DETAILS;
                    case "passport":
                        return PASSPORT;
                    case "driver_license":
                        return DRIVER_LICENSE;
                    case "identity_card":
                        return IDENTITY_CARD;
                    case "internal_passport":
                        return INTERNAL_PASSPORT;
                    case "address":
                        return ADDRESS;
                    case "utility_bill":
                        return UTILITY_BILL;
                    case "bank_statement":
                        return BANK_STATEMENT;
                    case "rental_agreement":
                        return RENTAL_AGREEMENT;
                    case "passport_registration":
                        return PASSPORT_REGISTRATION;
                    case "temporary_registration":
                        return TEMPORARY_REGISTRATION;
                    case "phone_number":
                        return PHONE_NUMBER;
                    case "email":
                        return EMAIL;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case PERSONAL_DETAILS:
                        return "personal_details";
                    case PASSPORT:
                        return "passport";
                    case DRIVER_LICENSE:
                        return "driver_license";
                    case IDENTITY_CARD:
                        return "identity_card";
                    case INTERNAL_PASSPORT:
                        return "internal_passport";
                    case ADDRESS:
                        return "address";
                    case UTILITY_BILL:
                        return "utility_bill";
                    case BANK_STATEMENT:
                        return "bank_statement";
                    case RENTAL_AGREEMENT:
                        return "rental_agreement";
                    case PASSPORT_REGISTRATION:
                        return "passport_registration";
                    case TEMPORARY_REGISTRATION:
                        return "temporary_registration";
                    case PHONE_NUMBER:
                        return "phone_number";
                    case EMAIL:
                        return "email";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class EncryptedCredentials {
        public string data;
        public string hash;
        public string secret;
        
        public EncryptedCredentials(Json.Object object) {
            data = object.get_string_member("data");
            hash = object.get_string_member("hash");
            secret = object.get_string_member("secret");
        }
    }
    
    public class InlineKeyboardMarkup : Object, Serializable, ReplyMarkup {
        public ArrayList<ArrayList<InlineKeyboardButton>> inline_keyboard;
        
        public InlineKeyboardMarkup(Json.Object? object = null) {
            inline_keyboard = new ArrayList<ArrayList<InlineKeyboardButton>>();
            if (object != null) {
                foreach (var array in object.get_array_member("inline_keyboard").get_elements()) {
                    inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
                    
                    foreach (var button in array.get_array().get_elements()) {
                        inline_keyboard.get(inline_keyboard.size - 1).add(new InlineKeyboardButton(button.get_object()));
                    }
                }
            }
        }
        
        public InlineKeyboardMarkup add_button(InlineKeyboardButton button) {
            if (inline_keyboard.size == 0) {
                inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
            }
            
            inline_keyboard.get(inline_keyboard.size - 1).add(button);
            return this;
        }
        
        public InlineKeyboardMarkup new_row() {
            inline_keyboard.add(new ArrayList<InlineKeyboardButton>());
            
            return this;
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("inline_keyboard");
            builder.begin_array();
            
            foreach (var array in inline_keyboard) {
                builder.begin_array();
                
                foreach (var button in array) {
                    builder.add_value(button.serialize());
                }
                
                builder.end_array();
            }
            
            builder.end_array();
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineKeyboardButton : Object, Serializable {
        public string text;
        public string? url;
        public LoginUrl? login_url;
        public string? callback_data;
        public string? switch_inline_query;
        public string? switch_inline_query_current_chat;
        public CallbackGame? callback_game;
        public bool? pay;
        
        public InlineKeyboardButton(Json.Object? object = null) {
            if (object != null) {
                text = object.get_string_member("text");
                
                if (object.has_member("url"))
                    url = object.get_string_member("url");
                
                if (object.has_member("login_url"))
                    login_url = new LoginUrl(object.get_object_member("login_url"));
                
                if (object.has_member("callback_data"))
                    callback_data = object.get_string_member("callback_data");
                
                if (object.has_member("switch_inline_query"))
                    switch_inline_query = object.get_string_member("switch_inline_query");
                
                if (object.has_member("switch_inline_query_current_chat"))
                    switch_inline_query_current_chat = object.get_string_member("switch_inline_query_current_chat");
                
                if (object.has_member("callback_game"))
                    callback_game = new CallbackGame();
                
                if (object.has_member("pay"))
                    pay = object.get_boolean_member("pay");
            }
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("text")
                   .add_string_value(text);
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (login_url != null) {
                builder.set_member_name("login_url");
                builder.add_value(login_url.serialize());
            }
            
            if (callback_data != null) {
                builder.set_member_name("callback_data");
                builder.add_string_value(callback_data);
            }
            
            if (switch_inline_query != null) {
                builder.set_member_name("switch_inline_query");
                builder.add_string_value(switch_inline_query);
            }
            
            if (switch_inline_query_current_chat != null) {
                builder.set_member_name("switch_inline_query_current_chat");
                builder.add_string_value(switch_inline_query_current_chat);
            }
            
            if (callback_game != null) {
                builder.set_member_name("callback_game");
                builder.begin_object().end_object();
            }
            
            if (pay != null) {
                builder.set_member_name("pay");
                builder.add_boolean_value(pay);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class ReplyKeyboardMarkup : Object, Serializable, ReplyMarkup {
        public ArrayList<ArrayList<KeyboardButton>> keyboard;
        public bool? resize_keyboard;
        public bool? one_time_keyboard;
        public bool? selective;
        
        public ReplyKeyboardMarkup() {
            keyboard = new ArrayList<ArrayList<KeyboardButton>>();
        }
        
        public ReplyKeyboardMarkup add_button(KeyboardButton button) {
            if (keyboard.size == 0) {
                keyboard.add(new ArrayList<KeyboardButton>());
            }
            
            keyboard.get(keyboard.size - 1).add(button);
            return this;
        }
        
        public ReplyKeyboardMarkup new_row() {
            keyboard.add(new ArrayList<KeyboardButton>());
            
            return this;
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("keyboard");
            builder.begin_array();
            
            foreach (var array in keyboard) {
                builder.begin_array();
                
                foreach (var button in array) {
                    builder.add_value(button.serialize());
                }
                
                builder.end_array();
            }
            
            builder.end_array();
            
            if (resize_keyboard != null) {
                builder.set_member_name("resize_keyboard");
                builder.add_boolean_value(resize_keyboard);
            }
            
            if (one_time_keyboard != null) {
                builder.set_member_name("one_time_keyboard");
                builder.add_boolean_value(one_time_keyboard);
            }
            
            if (selective != null) {
                builder.set_member_name("selective");
                builder.add_boolean_value(selective);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class KeyboardButton : Object, Serializable {
        public string text;
        public bool? request_contact;
        public bool? request_location;
        public KeyboardButtonPollType? request_poll;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("text");
            builder.add_string_value(text);
            
            if (request_contact != null) {
                builder.set_member_name("request_contact");
                builder.add_boolean_value(request_contact);
            }
            
            if (request_location != null) {
                builder.set_member_name("request_location");
                builder.add_boolean_value(request_location);
            }
            
            if (request_poll != null) {
                builder.set_member_name("request_poll");
                builder.add_value(request_poll.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class KeyboardButtonPollType : Object, Serializable {
        public Poll.Type type;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class ReplyKeyboardRemove : Object, Serializable, ReplyMarkup {
        private bool? selective;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("remove_keyboard");
            builder.add_boolean_value(true);
            
            if (selective != null) {
                builder.set_member_name("selective");
                builder.add_boolean_value(selective);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class ForceReply : Object, Serializable, ReplyMarkup {
        private bool? selective;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("force_reply");
            builder.add_boolean_value(true);
            
            if (selective != null) {
                builder.set_member_name("selective");
                builder.add_boolean_value(selective);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InputMediaPhoto : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("photo");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            return media.has_prefix("file://");
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            
            var file = File.new_for_path(media.replace("file://", ""));
            uint8[] content;
            
            yield file.load_contents_async(null, out content, null);
            
            arr += InputFile() {
                name = @"media$index",
                filename = file.get_basename(),
                buffer = new Soup.Buffer.take(content)
            };
            media = @"attach://media$index";
            
            return arr;
        }
    }
    
    public class InputMediaVideo : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? thumb;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? width;
        public int? height;
        public int? duration;
        public bool? supports_streaming;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("video");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (thumb != null) {
                builder.set_member_name("thumb");
                builder.add_string_value(thumb);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (width != null) {
                builder.set_member_name("width");
                builder.add_int_value(width);
            }
            
            if (height != null) {
                builder.set_member_name("height");
                builder.add_int_value(height);
            }
            
            if (duration != null) {
                builder.set_member_name("duration");
                builder.add_int_value(duration);
            }
            
            if (supports_streaming != null) {
                builder.set_member_name("supports_streaming");
                builder.add_boolean_value(supports_streaming);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (media.has_prefix("file://"))
                return true;
            
            if (thumb != null && thumb.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (media.has_prefix("file://")) {
                var file = File.new_for_path(media.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"media$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                media = @"attach://media$index";
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"thumb$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                thumb = @"attach://thumb$index";
            }
            
            return arr;
        }
    }
    
    public class InputMediaAnimation : Object, Serializable, InputMedia {
        public string media;
        public string? thumb;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? width;
        public int? height;
        public int? duration;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("animation");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (thumb != null) {
                builder.set_member_name("thumb");
                builder.add_string_value(thumb);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (width != null) {
                builder.set_member_name("width");
                builder.add_int_value(width);
            }
            
            if (height != null) {
                builder.set_member_name("height");
                builder.add_int_value(height);
            }
            
            if (duration != null) {
                builder.set_member_name("duration");
                builder.add_int_value(duration);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (media.has_prefix("file://"))
                return true;
            
            if (thumb != null && thumb.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (media.has_prefix("file://")) {
                var file = File.new_for_path(media.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"media$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                media = @"attach://media$index";
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"thumb$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                thumb = @"attach://thumb$index";
            }
            
            return arr;
        }
    }
    
    public class InputMediaAudio : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? thumb;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? duration;
        public string? performer;
        public string? title;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("audio");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (thumb != null) {
                builder.set_member_name("thumb");
                builder.add_string_value(thumb);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (duration != null) {
                builder.set_member_name("duration");
                builder.add_int_value(duration);
            }
            
            if (performer != null) {
                builder.set_member_name("performer");
                builder.add_string_value(performer);
            }
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (media.has_prefix("file://"))
                return true;
            
            if (thumb != null && thumb.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (media.has_prefix("file://")) {
                var file = File.new_for_path(media.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"media$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                media = @"attach://media$index";
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"thumb$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                thumb = @"attach://thumb$index";
            }
            
            return arr;
        }
    }
    
    public class InputMediaDocument : Object, Serializable, InputMedia, InputMediaGroupable {
        public string media;
        public string? thumb;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_content_type_detection;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("document");
            
            builder.set_member_name("media");
            builder.add_string_value(media);
            
            if (thumb != null) {
                builder.set_member_name("thumb");
                builder.add_string_value(thumb);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (disable_content_type_detection != null) {
                builder.set_member_name("disable_content_type_detection");
                builder.add_boolean_value(disable_content_type_detection);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
        
        public bool has_attachments() {
            if (media.has_prefix("file://"))
                return true;
            
            if (thumb != null && thumb.has_prefix("file://"))
                return true;
            
            return false;
        }
        
        public async InputFile[] append(int index) throws Error {
            InputFile[] arr = {};
            if (media.has_prefix("file://")) {
                var file = File.new_for_path(media.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"media$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                media = @"attach://media$index";
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                arr += InputFile() {
                    name = @"thumb$index",
                    filename = file.get_basename(),
                    buffer = new Soup.Buffer.take(content)
                };
                thumb = @"attach://thumb$index";
            }
            
            return arr;
        }
    }
    
    public class InlineQueryResultArticle : Object, Serializable, InlineQueryResult {
        public string id;
        public string title;
        public InputMessageContent input_message_content;
        public InlineKeyboardMarkup? reply_markup;
        public string? url;
        public bool? hide_url;
        public string? description;
        public string? thumb_url;
        public int? thumb_width;
        public int? thumb_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("article");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("input_message_content");
            builder.add_value(input_message_content.serialize());
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (hide_url != null) {
                builder.set_member_name("hide_url");
                builder.add_boolean_value(hide_url);
            }
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (thumb_url != null) {
                builder.set_member_name("thumb_url");
                builder.add_string_value(thumb_url);
            }
            
            if (thumb_width != null) {
                builder.set_member_name("thumb_width");
                builder.add_int_value(thumb_width);
            }
            
            if (thumb_height != null) {
                builder.set_member_name("thumb_height");
                builder.add_int_value(thumb_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultAudio : Object, Serializable, InlineQueryResult {
        public string id;
        public string audio_url;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public string? performer;
        public int? audio_duration;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("audio");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("audio_url");
            builder.add_string_value(audio_url);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (performer != null) {
                builder.set_member_name("performer");
                builder.add_string_value(performer);
            }
            
            if (audio_duration != null) {
                builder.set_member_name("audio_duration");
                builder.add_int_value(audio_duration);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedAudio : Object, Serializable, InlineQueryResult {
        public string id;
        public string audio_file_id;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("audio");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("audio_file_id");
            builder.add_string_value(audio_file_id);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultContact : Object, Serializable, InlineQueryResult {
        public string id;
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumb_url;
        public int? thumb_width;
        public int? thumb_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("contact");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("phone_number");
            builder.add_string_value(phone_number);
            
            builder.set_member_name("first_name");
            builder.add_string_value(first_name);
            
            if (last_name != null) {
                builder.set_member_name("last_name");
                builder.add_string_value(last_name);
            }
            
            if (vcard != null) {
                builder.set_member_name("vcard");
                builder.add_string_value(vcard);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            if (thumb_url != null) {
                builder.set_member_name("thumb_url");
                builder.add_string_value(thumb_url);
            }
            
            if (thumb_width != null) {
                builder.set_member_name("thumb_width");
                builder.add_int_value(thumb_width);
            }
            
            if (thumb_height != null) {
                builder.set_member_name("thumb_height");
                builder.add_int_value(thumb_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
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
    
    public class InlineQueryResultDocument : Object, Serializable, InlineQueryResult {
        public string id;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public string document_url;
        public string mime_type;
        public string? description;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        public string? thumb_url;
        public int? thumb_width;
        public int? thumb_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("document");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("document_url");
            builder.add_string_value(document_url);
            
            builder.set_member_name("mime_type");
            builder.add_string_value(mime_type);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            if (thumb_url != null) {
                builder.set_member_name("thumb_url");
                builder.add_string_value(thumb_url);
            }
            
            if (thumb_width != null) {
                builder.set_member_name("thumb_width");
                builder.add_int_value(thumb_width);
            }
            
            if (thumb_height != null) {
                builder.set_member_name("thumb_height");
                builder.add_int_value(thumb_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedDocument : Object, Serializable, InlineQueryResult {
        public string id;
        public string title;
        public string document_file_id;
        public string? description;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("document");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("document_file_id");
            builder.add_string_value(document_file_id);
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultGif : Object, Serializable, InlineQueryResult {
        public string id;
        public string gif_url;
        public int? gif_width;
        public int? gif_height;
        public int? gif_duration;
        public string thumb_url;
        public string? thumb_mime_type;
        public string? title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("gif");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("gif_url");
            builder.add_string_value(gif_url);
            
            builder.set_member_name("thumb_url");
            builder.add_string_value(thumb_url);
            
            if (gif_width != null) {
                builder.set_member_name("gif_width");
                builder.add_int_value(gif_width);
            }
            
            if (gif_height != null) {
                builder.set_member_name("gif_height");
                builder.add_int_value(gif_height);
            }
            
            if (gif_duration != null) {
                builder.set_member_name("gif_duration");
                builder.add_int_value(gif_duration);
            }
            
            if (thumb_mime_type != null) {
                builder.set_member_name("thumb_mime_type");
                builder.add_string_value(thumb_mime_type);
            }
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedGif : Object, Serializable, InlineQueryResult {
        public string id;
        public string gif_file_id;
        public string? title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("gif");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("gif_file_id");
            builder.add_string_value(gif_file_id);
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultLocation : Object, Serializable, InlineQueryResult {
        public string id;
        public double longitude;
        public double latitude;
        public string title;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumb_url;
        public int? thumb_width;
        public int? thumb_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("location");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (horizontal_accuracy != null) {
                builder.set_member_name("horizontal_accuracy");
                builder.add_double_value(horizontal_accuracy);
            }
            
            if (live_period != null) {
                builder.set_member_name("live_period");
                builder.add_int_value(live_period);
            }
            
            if (heading != null) {
                builder.set_member_name("heading");
                builder.add_int_value(heading);
            }
            
            if (proximity_alert_radius != null) {
                builder.set_member_name("proximity_alert_radius");
                builder.add_int_value(proximity_alert_radius);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            if (thumb_url != null) {
                builder.set_member_name("thumb_url");
                builder.add_string_value(thumb_url);
            }
            
            if (thumb_width != null) {
                builder.set_member_name("thumb_width");
                builder.add_int_value(thumb_width);
            }
            
            if (thumb_height != null) {
                builder.set_member_name("thumb_height");
                builder.add_int_value(thumb_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultMpeg4Gif : Object, Serializable, InlineQueryResult {
        public string id;
        public string mpeg4_url;
        public int? mpeg4_width;
        public int? mpeg4_height;
        public int? mpeg4_duration;
        public string thumb_url;
        public string? thumb_mime_type;
        public string? title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("mpeg4_gif");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("mpeg4_url");
            builder.add_string_value(mpeg4_url);
            
            builder.set_member_name("thumb_url");
            builder.add_string_value(thumb_url);
            
            if (mpeg4_width != null) {
                builder.set_member_name("mpeg4_width");
                builder.add_int_value(mpeg4_width);
            }
            
            if (mpeg4_height != null) {
                builder.set_member_name("mpeg4_height");
                builder.add_int_value(mpeg4_height);
            }
            
            if (mpeg4_duration != null) {
                builder.set_member_name("mpeg4_duration");
                builder.add_int_value(mpeg4_duration);
            }
            
            if (thumb_mime_type != null) {
                builder.set_member_name("thumb_mime_type");
                builder.add_string_value(thumb_mime_type);
            }
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedMpeg4Gif : Object, Serializable, InlineQueryResult {
        public string id;
        public string mpeg4_file_id;
        public string? title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("mpeg4_gif");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("mpeg4_file_id");
            builder.add_string_value(mpeg4_file_id);
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultPhoto : Object, Serializable, InlineQueryResult {
        public string id;
        public string photo_url;
        public int? photo_width;
        public int? photo_height;
        public string? title;
        public string? description;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("photo");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("photo_url");
            builder.add_string_value(photo_url);
            
            if (photo_width != null) {
                builder.set_member_name("photo_width");
                builder.add_int_value(photo_width);
            }
            
            if (photo_height != null) {
                builder.set_member_name("photo_height");
                builder.add_int_value(photo_height);
            }
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedPhoto : Object, Serializable, InlineQueryResult {
        public string id;
        public string photo_file_id;
        public string? title;
        public string? description;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("photo");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("photo_file_id");
            builder.add_string_value(photo_file_id);
            
            if (title != null) {
                builder.set_member_name("title");
                builder.add_string_value(title);
            }
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultVenue : Object, Serializable, InputMessageContent {
        public string id;
        public double longitude;
        public double latitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent input_message_content;
        public string? thumb_url;
        public int? thumb_width;
        public int? thumb_height;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("venue");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("address");
            builder.add_string_value(address);
            
            if (foursquare_id != null) {
                builder.set_member_name("foursquare_id");
                builder.add_string_value(foursquare_id);
            }
            
            if (foursquare_type != null) {
                builder.set_member_name("foursquare_type");
                builder.add_string_value(foursquare_type);
            }
            
            if (google_place_id != null) {
                builder.set_member_name("google_place_id");
                builder.add_string_value(google_place_id);
            }
            
            if (google_place_type != null) {
                builder.set_member_name("google_place_type");
                builder.add_string_value(google_place_type);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            if (thumb_url != null) {
                builder.set_member_name("thumb_url");
                builder.add_string_value(thumb_url);
            }
            
            if (thumb_width != null) {
                builder.set_member_name("thumb_width");
                builder.add_int_value(thumb_width);
            }
            
            if (thumb_height != null) {
                builder.set_member_name("thumb_height");
                builder.add_int_value(thumb_height);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultVideo : Object, Serializable, InlineQueryResult {
        public string id;
        public string video_url;
        public string mime_type;
        public string thumb_url;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? video_width;
        public int? video_height;
        public int? video_duration;
        public string? description;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("video");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("video_url");
            builder.add_string_value(video_url);
            
            builder.set_member_name("mime_type");
            builder.add_string_value(mime_type);
            
            builder.set_member_name("thumb_url");
            builder.add_string_value(thumb_url);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (video_width != null) {
                builder.set_member_name("video_width");
                builder.add_int_value(video_width);
            }
            
            if (video_height != null) {
                builder.set_member_name("video_height");
                builder.add_int_value(video_height);
            }
            
            if (video_duration != null) {
                builder.set_member_name("video_duration");
                builder.add_int_value(video_duration);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedVideo : Object, Serializable, InlineQueryResult {
        public string id;
        public string video_file_id;
        public string title;
        public string? description;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("video");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("video_file_id");
            builder.add_string_value(video_file_id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (description != null) {
                builder.set_member_name("description");
                builder.add_string_value(description);
            }
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultVoice : Object, Serializable, InlineQueryResult {
        public string id;
        public string voice_url;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? voice_duration;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("voice");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("voice_url");
            builder.add_string_value(voice_url);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (voice_duration != null) {
                builder.set_member_name("voice_duration");
                builder.add_int_value(voice_duration);
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedVoice : Object, Serializable, InlineQueryResult {
        public string id;
        public string voice_file_id;
        public string title;
        public string? caption;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("voice");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("voice_file_id");
            builder.add_string_value(voice_file_id);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            if (caption != null) {
                builder.set_member_name("caption");
                builder.add_string_value(caption);
            }
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                
                builder.set_member_name("caption_entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InlineQueryResultCachedSticker : Object, Serializable, InlineQueryResult {
        public string id;
        public string sticker_file_id;
        public InlineKeyboardMarkup? reply_markup;
        public InputMessageContent? input_message_content;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value("sticker");
            
            builder.set_member_name("id");
            builder.add_string_value(id);
            
            builder.set_member_name("sticker_file_id");
            builder.add_string_value(sticker_file_id);
            
            if (reply_markup != null) {
                builder.set_member_name("reply_markup");
                builder.add_value(reply_markup.serialize());
            }
            
            if (input_message_content != null) {
                builder.set_member_name("input_message_content");
                builder.add_value(input_message_content.serialize());
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InputTextMessageContent : Object, Serializable, InputMessageContent {
        public string message_text;
        public Configs.ParseMode? parse_mode;
        public MessageEntity[]? entities;
        public bool? disable_web_page_preview;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("message_text");
            builder.add_string_value(message_text);
            
            if (parse_mode != null) {
                builder.set_member_name("parse_mode");
                builder.add_string_value(parse_mode.to_string());
            }
            
            if (entities != null) {
                Serializable[] arr = {};
                foreach (var entity in entities) {
                    arr += entity;
                }
                
                builder.set_member_name("entities");
                builder.add_value(Serializable.serialize_array(arr));
            }
            
            if (disable_web_page_preview != null) {
                builder.set_member_name("disable_web_page_preview");
                builder.add_boolean_value(disable_web_page_preview);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InputLocationMessageContent : Object, Serializable, InputMessageContent {
        public double longitude;
        public double latitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            if (horizontal_accuracy != null) {
                builder.set_member_name("horizontal_accuracy");
                builder.add_double_value(horizontal_accuracy);
            }
            
            if (live_period != null) {
                builder.set_member_name("live_period");
                builder.add_int_value(live_period);
            }
            
            if (heading != null) {
                builder.set_member_name("heading");
                builder.add_int_value(heading);
            }
            
            if (proximity_alert_radius != null) {
                builder.set_member_name("proximity_alert_radius");
                builder.add_int_value(proximity_alert_radius);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InputVenueMessageContent : Object, Serializable, InputMessageContent {
        public double longitude;
        public double latitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("longitude");
            builder.add_double_value(longitude);
            
            builder.set_member_name("latitude");
            builder.add_double_value(latitude);
            
            builder.set_member_name("title");
            builder.add_string_value(title);
            
            builder.set_member_name("address");
            builder.add_string_value(address);
            
            if (foursquare_id != null) {
                builder.set_member_name("foursquare_id");
                builder.add_string_value(foursquare_id);
            }
            
            if (foursquare_type != null) {
                builder.set_member_name("foursquare_type");
                builder.add_string_value(foursquare_type);
            }
            
            if (google_place_id != null) {
                builder.set_member_name("google_place_id");
                builder.add_string_value(google_place_id);
            }
            
            if (google_place_type != null) {
                builder.set_member_name("google_place_type");
                builder.add_string_value(google_place_type);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class InputContactMessageContent : Object, Serializable, InputMessageContent {
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("phone_number");
            builder.add_string_value(phone_number);
            
            builder.set_member_name("first_name");
            builder.add_string_value(first_name);
            
            if (last_name != null) {
                builder.set_member_name("last_name");
                builder.add_string_value(last_name);
            }
            
            if (vcard != null) {
                builder.set_member_name("vcard");
                builder.add_string_value(vcard);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    protected interface InputMediaGroupable : Object, Serializable, InputMedia {}
    
    protected interface InputMedia : Object, Serializable {
        public abstract bool has_attachments();
        public abstract async InputFile[] append(int index) throws Error;
    }
    
    protected interface InputMessageContent : Object, Serializable {}
    
    protected interface InlineQueryResult : Object, Serializable {}
    
    public struct InputFile {
        string name;
        string filename;
        Soup.Buffer buffer;
    }
    
    protected interface ReplyMarkup : Object, Serializable {}
    
    protected interface Serializable : Object {
        public abstract Json.Node serialize();
        
        public virtual string to_string() {
            return Json.to_string(serialize(), false);
        }
        
        public static Json.Node serialize_array(Serializable[] array) {
            var builder = new Json.Builder();
            
            builder.begin_array();
            
            foreach (var item in array) {
                builder.add_value(item.serialize());
            }
            
            builder.end_array();
            
            return builder.get_root();
        }
        
        public static string array_to_string(Serializable[] array) {
            return Json.to_string(serialize_array(array), false);
        } 
    }
}
