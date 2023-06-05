namespace Telegram {
    
    public class SendChatAction : BaseRequest {
        public int64 chat_id;
        public int? message_thread_id;
        public ChatAction action;
        
        public override string method() {
            return "sendChatAction";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&action=$action";
            
            if (message_thread_id != null)
                queue += @"&message_thread_id=$message_thread_id";
            
            return queue;
        }
    }
    
    public enum ChatAction {
        TYPING,
        UPLOAD_PHOTO,
        RECORD_VIDEO,
        UPLOAD_VIDEO,
        RECORD_VOICE,
        UPLOAD_VOICE,
        UPLOAD_DOCUMENT,
        FIND_LOCATION,
        RECORD_VIDEO_NOTE,
        UPLOAD_VIDEO_NOTE;
        
        public string to_string() {
            switch (this) {
                case TYPING:
                    return "typing";
                case UPLOAD_PHOTO:
                    return "upload_photo";
                case RECORD_VIDEO:
                    return "record_video";
                case UPLOAD_VIDEO:
                    return "upload_video";
                case RECORD_VOICE:
                    return "record_voice";
                case UPLOAD_VOICE:
                    return "upload_voice";
                case UPLOAD_DOCUMENT:
                    return "upload_document";
                case FIND_LOCATION:
                    return "find_location";
                case RECORD_VIDEO_NOTE:
                    return "record_video_note";
                case UPLOAD_VIDEO_NOTE:
                    return "upload_video_note";
                default:
                    return "Undefined";
            }
        }
    }
}
