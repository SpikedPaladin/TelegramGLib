namespace Telegram {
    
    public class GameHighScore : Object {
        public int position;
        public User user;
        public int64 score;
        
        public GameHighScore(Json.Object object) {
            position = (int) object.get_int_member("position");
            user = new User(object.get_object_member("user"));
            score = object.get_int_member("score");
        }
    }
}
