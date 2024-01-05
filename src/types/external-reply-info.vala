namespace Telegram {
    
    public class ExternalReplyInfo : Object {
        public MessageOrigin origin;
        public Chat? chat;
        public int? message_id;
        public LinkPreviewOptions? link_preview_options;
        public Animation? animation;
        public Audio? audio;
        public Document? document;
        public PhotoSize[]? photo;
        public Sticker? sticker;
        public Story? story;
        public Video? video;
        public VideoNote? video_note;
        public Voice? voice;
        public bool has_media_spoiler;
        public Contact? contact;
        public Dice? dice;
        public Game? game;
        public Giveaway? giveaway;
        public GiveawayWinners? giveaway_winners;
        public Invoice? invoice;
        public Location? location;
        public Poll? poll;
        public Venue? venue;
        
        public ExternalReplyInfo(Json.Object object) {
            origin = MessageOrigin.from_json(object.get_object_member("origin"));
            
            if (object.has_member("chat"))
                chat = new Chat(object.get_object_member("chat"));
            
            if (object.has_member("message_id"))
                message_id = (int) object.get_int_member("message_id");
            
            if (object.has_member("link_preview_options"))
                link_preview_options = new LinkPreviewOptions(object.get_object_member("link_preview_options"));
            
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
            
            if (object.has_member("story"))
                story = new Story(object.get_object_member("story"));
            
            if (object.has_member("video"))
                video = new Video(object.get_object_member("video"));
            
            if (object.has_member("video_note"))
                video_note = new VideoNote(object.get_object_member("video_note"));
            
            if (object.has_member("voice"))
                voice = new Voice(object.get_object_member("voice"));
            
            if (object.has_member("has_media_spoiler"))
                has_media_spoiler = object.get_boolean_member("has_media_spoiler");
            
            if (object.has_member("contact"))
                contact = new Contact(object.get_object_member("contact"));
            
            if (object.has_member("dice"))
                dice = new Dice(object.get_object_member("dice"));
            
            if (object.has_member("game"))
                game = new Game(object.get_object_member("game"));
            
            if (object.has_member("giveaway"))
                giveaway = new Giveaway(object.get_object_member("giveaway"));
            
            if (object.has_member("giveaway_winners"))
                giveaway_winners = new GiveawayWinners(object.get_object_member("giveaway_winners"));
            
            if (object.has_member("invoice"))
                invoice = new Invoice(object.get_object_member("invoice"));
            
            if (object.has_member("location"))
                location = new Location(object.get_object_member("location"));
            
            if (object.has_member("poll"))
                poll = new Poll(object.get_object_member("poll"));
            
            if (object.has_member("venue"))
                venue = new Venue(object.get_object_member("venue"));
        }
    }
}