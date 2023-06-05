namespace Telegram {
    
    public class Message {
        public int message_id;
        public int? message_thread_id;
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
        public bool is_topic_message;
        public bool is_automatic_forward;
        public Message? reply_to_message;
        public User? via_bot;
        public int64? edit_date;
        public bool has_protected_content;
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
        public bool has_media_spoiler;
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
        public UserShared? user_shared;
        public ChatShared? chat_shared;
        public string? connected_website;
        public WriteAccessAllowed? write_access_allowed;
        public PassportData? passport_data;
        public ProximityAlertTriggered? proximity_alert_triggered;
        public ForumTopicCreated? forum_topic_created;
        public ForumTopicEdited? forum_topic_edited;
        public ForumTopicClosed? forum_topic_closed;
        public ForumTopicReopened? forum_topic_reopened;
        public GeneralForumTopicHidden? general_forum_topic_hidden;
        public GeneralForumTopicUnhidden? general_forum_topic_unhidden;
        public VideoChatScheduled? video_chat_scheduled;
        public VideoChatStarted? video_chat_started;
        public VideoChatEnded? video_chat_ended;
        public VideoChatParticipantsInvited? video_chat_participants_invited;
        public WebAppData? web_app_data;
        public InlineKeyboardMarkup? reply_markup;
        
        public Message(Json.Object object) {
            message_id = (int) object.get_int_member("message_id");
            date = object.get_int_member("date");
            chat = new Chat(object.get_object_member("chat"));
            
            if (object.has_member("message_thread_id"))
                message_thread_id = (int) object.get_int_member("message_thread_id");
            
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
            
            if (object.has_member("is_topic_message"))
                is_topic_message = object.get_boolean_member("is_topic_message");
            
            if (object.has_member("is_automatic_forward"))
                is_automatic_forward = object.get_boolean_member("is_automatic_forward");
            
            if (object.has_member("reply_to_message"))
                reply_to_message = new Message(object.get_object_member("reply_to_message"));
            
            if (object.has_member("via_bot"))
                via_bot = new User(object.get_object_member("via_bot"));
            
            if (object.has_member("edit_date"))
                edit_date = object.get_int_member("edit_date");
            
            if (object.has_member("has_protected_content"))
                has_protected_content = object.get_boolean_member("has_protected_content");
            
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
            
            if (object.has_member("has_media_spoiler"))
                has_media_spoiler = object.get_boolean_member("has_media_spoiler");
            
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
            
            if (object.has_member("user_shared"))
                user_shared = new UserShared(object.get_object_member("user_shared"));
            
            if (object.has_member("chat_shared"))
                chat_shared = new ChatShared(object.get_object_member("chat_shared"));
            
            if (object.has_member("connected_website"))
                connected_website = object.get_string_member("connected_website");
            
            if (object.has_member("write_access_allowed"))
                write_access_allowed = new WriteAccessAllowed(object.get_object_member("write_access_allowed"));
            
            if (object.has_member("passport_data"))
                passport_data = new PassportData(object.get_object_member("passport_data"));
            
            if (object.has_member("proximity_alert_triggered"))
                proximity_alert_triggered = new ProximityAlertTriggered(object.get_object_member("proximity_alert_triggered"));
            
            if (object.has_member("forum_topic_created"))
                forum_topic_created = new ForumTopicCreated(object.get_object_member("forum_topic_created"));
            
            if (object.has_member("forum_topic_edited"))
                forum_topic_edited = new ForumTopicEdited(object.get_object_member("forum_topic_edited"));
            
            if (object.has_member("forum_topic_closed"))
                forum_topic_closed = new ForumTopicClosed();
            
            if (object.has_member("forum_topic_reopened"))
                forum_topic_reopened = new ForumTopicReopened();
            
            if (object.has_member("general_forum_topic_hidden"))
                general_forum_topic_hidden = new GeneralForumTopicHidden();
            
            if (object.has_member("general_forum_topic_unhidden"))
                general_forum_topic_unhidden = new GeneralForumTopicUnhidden();
            
            if (object.has_member("video_chat_scheduled"))
                video_chat_scheduled = new VideoChatScheduled(object.get_object_member("video_chat_scheduled"));
            
            if (object.has_member("video_chat_started"))
                video_chat_started = new VideoChatStarted();
            
            if (object.has_member("video_chat_ended"))
                video_chat_ended = new VideoChatEnded(object.get_object_member("video_chat_ended"));
            
            if (object.has_member("video_chat_participants_invited"))
                video_chat_participants_invited = new VideoChatParticipantsInvited(object.get_object_member("video_chat_participants_invited"));
            
            if (object.has_member("web_app_data"))
                web_app_data = new WebAppData(object.get_object_member("web_app_data"));
            
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
}
