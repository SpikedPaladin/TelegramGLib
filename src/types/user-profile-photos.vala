namespace Telegram {
    
    public class UserProfilePhotos : Object {
        public int total_count;
        public List<List<PhotoSize>> photos;
        
        public UserProfilePhotos(Json.Object object) {
            total_count = (int) object.get_int_member("total_count");
            
            photos = new List<List<PhotoSize>>();
            foreach (var array in object.get_array_member("photos").get_elements()) {
                photos.append(new List<PhotoSize>());
                
                foreach (var photo in array.get_array().get_elements()) {
                    photos.last().data.append(new PhotoSize(photo.get_object()));
                }
            }
        }
    }
}
