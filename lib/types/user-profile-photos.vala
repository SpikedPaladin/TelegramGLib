using Gee;

namespace Telegram.Types {
	
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
}
