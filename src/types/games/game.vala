namespace Telegram {
    
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
}
