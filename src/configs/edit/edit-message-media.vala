using Telegram.Types;

namespace Telegram.Configs {
	
    public class EditMessageMediaConfig : UploadConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public InputMedia[] media;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageMedia";
        }
        
        public override string queue() {
            Serializable[] arr = {};
            foreach (var entity in media) {
                arr += entity;
            }
            var queue = @"media=$(Serializable.array_to_string(arr))";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            foreach (var element in media) {
                
                if (element.has_attachments())
                    return true;
            }
            
            return false;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            for (int i = 0; i < media.length; i++) {
                var arr = yield media[i].append(i);
                
                foreach (var file in arr) {
                    multipart.append_form_file(file.name, file.filename, "", file.body);
                }
            }
            
            return multipart;
        }
    }
}
