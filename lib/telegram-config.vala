using Telegram.Types;
using Telegram.Util;

[CCode (cprefix = "Telegram", lower_case_cprefix = "telegram_")]
namespace Telegram.Configs {
    
    public class SendMessageConfig : BaseConfig {
        public int64 chat_id;
        public string text;
        public ParseMode? parse_mode;
        public bool? disable_web_page_preview;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&text=$text";
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (disable_web_page_preview != null)
                queue += @"&disable_web_page_preview=$disable_web_page_preview";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class EditMessageTextConfig : BaseConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public string text;
        public ParseMode? parse_mode;
        public MessageEntity[]? entities;
        public bool? disable_web_page_preview;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageText";
        }
        
        public override string queue() {
            var queue = @"text=$text";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (entities != null) {
                Serializable[] arr = {};
                foreach (var entity in entities) {
                    arr += entity;
                }
                queue += @"&entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_web_page_preview != null)
                queue += @"&disable_web_page_preview=$disable_web_page_preview";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
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
                    multipart.append_form_file(file.name, file.filename, "", file.buffer);
                }
            }
            
            return multipart;
        }
    }
    
    public class EditMessageCaptionConfig : BaseConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageCaption";
        }
        
        public override string queue() {
            var queue = "";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class EditMessageReplyMarkupConfig : BaseConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "editMessageReplyMarkup";
        }
        
        public override string queue() {
            var queue = "";
            
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
    }
    
    public class ForwardMessage : BaseConfig {
        public int64 chat_id;
        public int64 from_chat_id;
        public bool? disable_notification;
        public int message_id;
        
        public override string method() {
            return "forwardMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&from_chat_id=$from_chat_id&message_id=$message_id";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            return queue;
        }
    }
    
    public class CopyMessageConfig : BaseConfig {
        public int64 chat_id;
        public int64 from_chat_id;
        public int message_id;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "copyMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&from_chat_id=$from_chat_id&message_id=$message_id";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class DeleteMessageConfig : BaseConfig {
        public int64 chat_id;
        public int message_id;
        
        public override string method() {
            return "deleteMessage";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&message_id=$message_id";
        }
    }
    
    public class SendPhotoConfig : UploadConfig {
        public int64 chat_id;
        public string photo;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendPhoto";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!has_attachments())
                queue += @"&photo=$photo";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return photo.has_prefix("file://");
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(photo.replace("file://", ""));
            uint8[] content;
            
            yield file.load_contents_async(null, out content, null);
            
            multipart.append_form_file("photo", file.get_basename(), "", new Soup.Buffer.take(content));
            
            return multipart;
        }
    }
    
    public class SendAudioConfig : UploadConfig {
        public int64 chat_id;
        public string audio;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public int? duration;
        public string? performer;
        public string? title;
        public string? thumb;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendAudio";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!audio.has_prefix("file://"))
                queue += @"&audio=$audio";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (performer != null)
                queue += @"&performer=$performer";
            
            if (title != null)
                queue += @"&title=$title";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return audio.has_prefix("file://") || (thumb != null && thumb.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (audio.has_prefix("file://")) {
                var file = File.new_for_path(audio.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("audio", file.get_basename(), "", new Soup.Buffer.take(content));
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("thumb", file.get_basename(), "", new Soup.Buffer.take(content));
                thumb = "attach://thumb";
            }
            
            return multipart;
        }
    }
    
    public class SendDocumentConfig : UploadConfig {
        public int64 chat_id;
        public string document;
        public string? thumb;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_content_type_detection;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendDocument";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!document.has_prefix("file://"))
                queue += @"&document=$document";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_content_type_detection != null)
                queue += @"&disable_content_type_detection=$disable_content_type_detection";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return document.has_prefix("file://") || (thumb != null && thumb.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (document.has_prefix("file://")) {
                var file = File.new_for_path(document.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("document", file.get_basename(), "", new Soup.Buffer.take(content));
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("thumb", file.get_basename(), "", new Soup.Buffer.take(content));
                thumb = "attach://thumb";
            }
            
            return multipart;
        }
    }
    
    public class SendVideoConfig : UploadConfig {
        public int64 chat_id;
        public string video;
        public int? duration;
        public int? width;
        public int? height;
        public string? thumb;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? supports_streaming;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVideo";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!video.has_prefix("file://"))
                queue += @"&video=$video";
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (width != null)
                queue += @"&width=$width";
            
            if (height != null)
                queue += @"&height=$height";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (supports_streaming != null)
                queue += @"&supports_streaming=$supports_streaming";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return video.has_prefix("file://") || (thumb != null && thumb.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (video.has_prefix("file://")) {
                var file = File.new_for_path(video.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("video", file.get_basename(), "", new Soup.Buffer.take(content));
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("thumb", file.get_basename(), "", new Soup.Buffer.take(content));
                thumb = "attach://thumb";
            }
            
            return multipart;
        }
    }
    
    public class SendAnimationConfig : UploadConfig {
        public int64 chat_id;
        public string animation;
        public int? duration;
        public int? width;
        public int? height;
        public string? thumb;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendAnimation";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!animation.has_prefix("file://"))
                queue += @"&animation=$animation";
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (width != null)
                queue += @"&width=$width";
            
            if (height != null)
                queue += @"&height=$height";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return animation.has_prefix("file://") || (thumb != null && thumb.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (animation.has_prefix("file://")) {
                var file = File.new_for_path(animation.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("animation", file.get_basename(), "", new Soup.Buffer.take(content));
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("thumb", file.get_basename(), "", new Soup.Buffer.take(content));
                thumb = "attach://thumb";
            }
            
            return multipart;
        }
    }
    
    public class SendVoiceConfig : UploadConfig {
        public int64 chat_id;
        public string voice;
        public string? thumb;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVoice";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!voice.has_prefix("file://"))
                queue += @"&voice=$voice";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return voice.has_prefix("file://");
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(voice.replace("file://", ""));
            uint8[] content;
            
            yield file.load_contents_async(null, out content, null);
            
            multipart.append_form_file("voice", file.get_basename(), "", new Soup.Buffer.take(content));
            
            return multipart;
        }
    }
    
    public class SendVideoNoteConfig : UploadConfig {
        public int64 chat_id;
        public string video_note;
        public int? duration;
        public int? length;
        public string? thumb;
        public string? caption;
        public ParseMode? parse_mode;
        public MessageEntity[]? caption_entities;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVideoNote";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (!video_note.has_prefix("file://"))
                queue += @"&video_note=$video_note";
            
            if (duration != null)
                queue += @"&duration=$duration";
            
            if (length != null)
                queue += @"&length=$length";
            
            if (thumb != null)
                queue += @"&thumb=$thumb";
            
            if (caption != null)
                queue += @"&caption=$caption";
            
            if (parse_mode != null)
                queue += @"&parse_mode=$parse_mode";
            
            if (caption_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in caption_entities) {
                    arr += entity;
                }
                queue += @"&caption_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
        
        public override bool has_attachments() {
            return video_note.has_prefix("file://") || (thumb != null && thumb.has_prefix("file://"));
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            
            if (video_note.has_prefix("file://")) {
                var file = File.new_for_path(video_note.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("video_note", file.get_basename(), "", new Soup.Buffer.take(content));
            }
            
            if (thumb != null && thumb.has_prefix("file://")) {
                var file = File.new_for_path(thumb.replace("file://", ""));
                uint8[] content;
                
                yield file.load_contents_async(null, out content, null);
                
                multipart.append_form_file("thumb", file.get_basename(), "", new Soup.Buffer.take(content));
                thumb = "attach://thumb";
            }
            
            return multipart;
        }
    }
    
    public class SendMediaGroupConfig : UploadConfig {
        public int64 chat_id;
        public InputMediaGroupable[] media;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        
        public override string method() {
            return "sendMediaGroup";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (media != null) {
                Serializable[] arr = {};
                foreach (var entity in media) {
                    arr += entity;
                }
                queue += @"&media=$(Serializable.array_to_string(arr))";
            }
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
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
                    multipart.append_form_file(file.name, file.filename, "", file.buffer);
                }
            }
            
            return multipart;
        }
    }
    
    public class SendLocationConfig : BaseConfig {
        public int64 chat_id;
        public double latitude;
        public double longitude;
        public double? horizontal_accuracy;
        public int? live_period;
        public int? heading;
        public int? proximity_alert_radius;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendLocation";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&latitude=$latitude&longitude=$longitude";
            
            if (horizontal_accuracy != null)
                queue += @"&horizontal_accuracy=$horizontal_accuracy";
            
            if (live_period != null)
                queue += @"&live_period=$live_period";
            
            if (heading != null)
                queue += @"&heading=$heading";
            
            if (proximity_alert_radius != null)
                queue += @"&proximity_alert_radius=$proximity_alert_radius";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class EditMessageLiveLocationConfig : BaseConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public double latitude;
        public double longitude;
        public double? horizontal_accuracy;
        public int? heading;
        public int? proximity_alert_radius;
        public ReplyMarkup? reply_markup;
        
        
        public override string method() {
            return "editMessageLiveLocation";
        }
        
        public override string queue() {
            var queue = @"latitude=$latitude&longitude=$longitude";
            
            if (chat_id != null)
                queue += @"&chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            if (inline_message_id != null)
                queue += @"&inline_message_id=$inline_message_id";
            
            if (horizontal_accuracy != null)
                queue += @"&horizontal_accuracy=$horizontal_accuracy";
            
            if (heading != null)
                queue += @"&heading=$heading";
            
            if (proximity_alert_radius != null)
                queue += @"&proximity_alert_radius=$proximity_alert_radius";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class StopMessageLiveLocationConfig : BaseConfig {
        public int64? chat_id;
        public int? message_id;
        public string? inline_message_id;
        public InlineKeyboardMarkup? reply_markup;
        
        public override string method() {
            return "stopMessageLiveLocation";
        }
        
        public override string queue() {
            var queue = "";
            
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
    }
    
    public class SendVenueConfig : BaseConfig {
        public int64 chat_id;
        public double latitude;
        public double longitude;
        public string title;
        public string address;
        public string? foursquare_id;
        public string? foursquare_type;
        public string? google_place_id;
        public string? google_place_type;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendVenue";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&latitude=$latitude&longitude=$longitude&title=$title&address=$address";
            
            if (foursquare_id != null)
                queue += @"&foursquare_id=$foursquare_id";
            
            if (foursquare_type != null)
                queue += @"&foursquare_type=$foursquare_type";
            
            if (google_place_id != null)
                queue += @"&google_place_id=$google_place_id";
            
            if (google_place_type != null)
                queue += @"&google_place_type=$google_place_type";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class SendContactConfig : BaseConfig {
        public int64 chat_id;
        public string phone_number;
        public string first_name;
        public string? last_name;
        public string? vcard;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendContact";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&phone_number=$phone_number&first_name=$first_name";
            
            if (last_name != null)
                queue += @"&last_name=$last_name";
            
            if (vcard != null)
                queue += @"&vcard=$vcard";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class SendPollConfig : BaseConfig {
        public int64 chat_id;
        public string question;
        public string[] options;
        public bool? is_anonymous;
        public Poll.Type? type;
        public bool? allows_multiple_answers;
        public int? correct_option_id;
        public string? explanation;
        public ParseMode? explanation_parse_mode;
        public MessageEntity[]? explanation_entities;
        public int? open_period;
        public int64? close_date;
        public bool? is_closed;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendPoll";
        }
        public override string queue() {
            var queue = @"chat_id=$chat_id&question=$question&options=$(serialize_array(options))";
            
            if (is_anonymous != null)
                queue += @"&is_anonymous=$is_anonymous";
            
            if (type != null)
                queue += @"&type=$type";
            
            if (allows_multiple_answers != null)
                queue += @"&allows_multiple_answers=$allows_multiple_answers";
            
            if (correct_option_id != null)
                queue += @"&correct_option_id=$correct_option_id";
            
            if (explanation != null)
                queue += @"&explanation=$explanation";
            
            if (explanation_parse_mode != null)
                queue += @"&explanation_parse_mode=$explanation_parse_mode";
            
            if (explanation_entities != null) {
                Serializable[] arr = {};
                foreach (var entity in explanation_entities) {
                    arr += entity;
                }
                queue += @"&explanation_entities=$(Serializable.array_to_string(arr))";
            }
            
            if (open_period != null)
                queue += @"&open_period=$open_period";
            
            if (close_date != null)
                queue += @"&close_date=$close_date";
            
            if (is_closed != null)
                queue += @"&is_closed=$is_closed";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class SendDiceConfig : BaseConfig {
        public int64 chat_id;
        public string? emoji;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendDice";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (emoji != null)
                queue += @"&emoji=$emoji";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class SendChatActionConfig : BaseConfig {
        public int64 chat_id;
        public ChatAction action;
        
        public override string method() {
            return "sendChatAction";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&action=$action";
        }
    }
    
    public class GetUserProfilePhotosConfig : BaseConfig {
        public int64 user_id;
        public int? offset;
        public int? limit;
        
        public override string method() {
            return "getUserProfilePhotos";
        }
        
        public override string queue() {
            var queue = @"user_id=$user_id";
            
            if (offset != null)
                queue += @"&offset=$offset";
            
            if (limit != null)
                queue += @"&limit=$limit";
            
            return queue;
        }
    }
    
    public class KickChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public int64? until_date;
        public bool? revoke_messages;
        
        public override string method() {
            return "kickChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (until_date != null)
                queue += @"&until_date=$until_date";
            
            if (revoke_messages != null)
                queue += @"&revoke_messages=$revoke_messages";
            
            return queue;
        }
    }
    
    public class UnbanChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public bool? only_if_banned;
        
        public override string method() {
            return "unbanChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (only_if_banned != null)
                queue += @"&only_if_banned=$only_if_banned";
            
            return queue;
        }
    }
    
    public class RestrictChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public ChatPermissions permissions;
        public int64? until_date;
        
        public override string method() {
            return "restrictChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id&permissions=$permissions";
            
            if (until_date != null)
                queue += @"&until_date=$until_date";
            
            return queue;
        }
    }
    
    public class PromoteChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public bool? is_anonymous;
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
        
        public override string method() {
            return "promoteChatMember";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&user_id=$user_id";
            
            if (is_anonymous != null)
                queue += @"&is_anonymous=$is_anonymous";
            
            if (can_manage_chat != null)
                queue += @"&can_manage_chat=$can_manage_chat";
            
            if (can_post_messages != null)
                queue += @"&can_post_messages=$can_post_messages";
            
            if (can_edit_messages != null)
                queue += @"&can_edit_messages=$can_edit_messages";
            
            if (can_delete_messages != null)
                queue += @"&can_delete_messages=$can_delete_messages";
            
            if (can_manage_voice_chats != null)
                queue += @"&can_manage_voice_chats=$can_manage_voice_chats";
            
            if (can_restrict_members != null)
                queue += @"&can_restrict_members=$can_restrict_members";
            
            if (can_promote_members != null)
                queue += @"&can_promote_members=$can_promote_members";
            
            if (can_change_info != null)
                queue += @"&can_change_info=$can_change_info";
            
            if (can_invite_users != null)
                queue += @"&can_invite_users=$can_invite_users";
            
            if (can_pin_messages != null)
                queue += @"&can_pin_messages=$can_pin_messages";
            
            return queue;
        }
    }
    
    public class SetChatAdministratorCustomTitleConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        public string custom_title;
        
        public override string method() {
            return "setChatAdministratorCustomTitle";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&user_id=$user_id&custom_title=$custom_title";
        }
    }
    
    public class SetChatPermissionsConfig : BaseConfig {
        public int64 chat_id;
        public ChatPermissions permissions;
        
        public override string method() {
            return "setChatPermissions";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&permissions=$permissions";
        }
    }
    
    public class ExportChatInviteLink : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "exportChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class CreateChatInviteLink : BaseConfig {
        public int64 chat_id;
        public int64? expire_date;
        public int? member_limit;
        
        public override string method() {
            return "createChatInviteLink";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (expire_date != null)
                queue += @"&expire_date=$expire_date";
            
            if (member_limit != null)
                queue += @"&member_limit=$member_limit";
            
            return queue;
        }
    }
    
    public class EditChatInviteLinkConfig : BaseConfig {
        public int64 chat_id;
        public string invite_link;
        public int64? expire_date;
        public int? member_limit;
        
        public override string method() {
            return "editChatInviteLink";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&invite_link=$invite_link";
            
            if (expire_date != null)
                queue += @"&expire_date=$expire_date";
            
            if (member_limit != null)
                queue += @"&member_limit=$member_limit";
            
            return queue;
        }
    }
    
    public class RevokeChatInviteLinkConfig : BaseConfig {
        public int64 chat_id;
        public string invite_link;
        
        public override string method() {
            return "revokeChatInviteLink";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&invite_link=$invite_link";
        }
    }
    
    public class SetChatPhotoConfig : UploadConfig {
        public int64 chat_id;
        public string photo;
        
        public override string method() {
            return "setChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
        
        public override bool has_attachments() {
            return true;
        }
        
        public override async Soup.Multipart create_multipart() throws Error {
            var multipart = new Soup.Multipart("multipart/form-data");
            var file = File.new_for_path(photo.replace("file://", ""));
            uint8[] content;
            
            yield file.load_contents_async(null, out content, null);
            
            multipart.append_form_file("photo", file.get_basename(), "", new Soup.Buffer.take(content));
            
            return multipart;
        }
    }
    
    public class DeleteChatPhotoConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "deleteChatPhoto";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class SetChatTitleConfig : BaseConfig {
        public int64 chat_id;
        public string title;
        
        public override string method() {
            return "setChatTitle";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&title=$title";
        }
    }
    
    public class SetChatDescriptionConfig : BaseConfig {
        public int64 chat_id;
        public string? description;
        
        public override string method() {
            return "setChatTitle";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (description != null)
                queue += @"&description=$description";
            
            return queue;
        }
    }
    
    public class PinChatMessageConfig : BaseConfig {
        public int64 chat_id;
        public int message_id;
        public bool? disable_notification;
        
        public override string method() {
            return "pinChatMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&message_id=$message_id";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            return queue;
        }
    }
    
    public class UnpinChatMessageConfig : BaseConfig {
        public int64 chat_id;
        public int? message_id;
        
        public override string method() {
            return "unpinChatMessage";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id";
            
            if (message_id != null)
                queue += @"&message_id=$message_id";
            
            return queue;
        }
    }
    
    public class UnpinAllChatMessagesConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "unpinAllChatMessages";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class LeaveChatConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "leaveChat";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class GetChatAdministratorsConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "getChatAdministrators";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class GetChatMembersCountConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "getChatMembersCount";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class GetChatMemberConfig : BaseConfig {
        public int64 chat_id;
        public int64 user_id;
        
        public override string method() {
            return "getChatMember";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&user_id=$user_id";
        }
    }
    
    public class SetChatStickerSetConfig : BaseConfig {
        public int64 chat_id;
        public string sticker_set_name;
        
        public override string method() {
            return "setChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id&sticker_set_name=$sticker_set_name";
        }
    }
    
    public class DeleteChatStickerSetConfig : BaseConfig {
        public int64 chat_id;
        
        public override string method() {
            return "deleteChatStickerSet";
        }
        
        public override string queue() {
            return @"chat_id=$chat_id";
        }
    }
    
    public class AnswerCallbackQueryConfig : BaseConfig {
        public string callback_query_id;
        public string? text;
        public bool? show_alert;
        public string? url;
        public int? cache_time;
        
        public override string method() {
            return "answerCallbackQuery";
        }
        
        public override string queue() {
            var queue = @"callback_query_id=$callback_query_id";
            if (text != null)
                queue += @"&text=$text";
            
            if (show_alert != null)
                queue += @"&show_alert=$show_alert";
            
            if (url != null)
                queue += @"&url=$url";
            
            if (cache_time != null)
                queue += @"&cache_time=$cache_time";
            
            return queue;
        }
    }
    
    public class AnswerInlineQuery : BaseConfig {
        public string inline_query_id;
        public InlineQueryResult[] results;
        public int? cache_time;
        public bool? is_personal;
        public string? next_offset;
        public string? switch_pm_text;
        public string? switch_pm_parameter;
        
        public override string method() {
            return "answerInlineQuery";
        }
        
        public override string queue() {
            var queue = @"inline_query_id=$inline_query_id";
            
            Serializable[] arr = {};
            foreach (var entity in results) {
                arr += entity;
            }
            queue += @"&results=$(Serializable.array_to_string(arr))";
            
            if (cache_time != null)
                queue += @"&cache_time=$cache_time";
            
            if (is_personal != null)
                queue += @"&is_personal=$is_personal";
            
            if (next_offset != null)
                queue += @"&next_offset=$next_offset";
            
            if (switch_pm_text != null)
                queue += @"&switch_pm_text=$switch_pm_text";
            
            if (switch_pm_parameter != null)
                queue += @"&switch_pm_parameter=$switch_pm_parameter";
            
            return queue;
        }
    }
    
    public class SetMyCommandsConfig : BaseConfig {
        public BotCommand[] commands;
        
        public override string method() {
            return "setMyCommands";
        }
        
        public override string queue() {
            Serializable[] arr = {};
            foreach (var element in commands) {
                arr += element;
            }
            return @"commands=$(Serializable.array_to_string(arr))";
        }
    }
    
    public class SendInvoiceConfig : BaseConfig {
        public int64 chat_id;
        public string title;
        public string description;
        public string payload;
        public string provider_token;
        public string currency;
        public LabeledPrice[] prices;
        public int? max_tip_amount;
        public int[]? suggested_tip_amounts;
        public string? start_parameter;
        public string? provider_data;
        public string? photo_url;
        public int? photo_size;
        public int? photo_width;
        public int? photo_height;
        public bool? need_name;
        public bool? need_phone_number;
        public bool? need_email;
        public bool? need_shipping_address;
        public bool? send_phone_number_to_provider;
        public bool? send_email_to_provider;
        public bool? is_flexible;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendInvoice";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&title=$title&description=$description&payload=$payload&provider_token=$provider_token&currency=$currency";
            
            Serializable[] arr = {};
            foreach (var element in prices) {
                arr += element;
            }
            queue += @"&prices=$(Serializable.array_to_string(arr))";
            
            if (max_tip_amount != null)
                queue += @"&max_tip_amount=$max_tip_amount";
            
            if (suggested_tip_amounts != null) {
                var builder = new Json.Builder();
                
                builder.begin_array();
                
                foreach (var element in suggested_tip_amounts) {
                    builder.add_int_value(element);
                }
                
                builder.end_array();
                
                queue += @"&suggested_tip_amounts=$(Json.to_string(builder.get_root(), false))";
            }
            
            if (start_parameter != null)
                queue += @"&start_parameter=$start_parameter";
            
            if (provider_data != null)
                queue += @"&provider_data=$provider_data";
            
            if (photo_url != null)
                queue += @"&photo_url=$photo_url";
            
            if (photo_size != null)
                queue += @"&photo_size=$photo_size";
            
            if (photo_width != null)
                queue += @"&photo_width=$photo_width";
            
            if (photo_height != null)
                queue += @"&photo_height=$photo_height";
            
            if (need_name != null)
                queue += @"&need_name=$need_name";
            
            if (need_phone_number != null)
                queue += @"&need_phone_number=$need_phone_number";
            
            if (need_email != null)
                queue += @"&need_email=$need_email";
            
            if (need_shipping_address != null)
                queue += @"&need_shipping_address=$need_shipping_address";
            
            if (send_phone_number_to_provider != null)
                queue += @"&send_phone_number_to_provider=$send_phone_number_to_provider";
            
            if (send_email_to_provider != null)
                queue += @"&send_email_to_provider=$send_email_to_provider";
            
            if (is_flexible != null)
                queue += @"&is_flexible=$is_flexible";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
            return queue;
        }
    }
    
    public class AnswerShippingQueryConfig : BaseConfig {
        public string shipping_query_id;
        public bool ok;
        public ShippingOption[]? shipping_options;
        public string? error_message;
        
        public override string method() {
            return "answerShippingQuery";
        }
        
        public override string queue() {
            var queue = @"shipping_query_id=$shipping_query_id&ok=$ok";
            
            if (shipping_options != null) {
                Serializable[] arr = {};
                foreach (var entity in shipping_options) {
                    arr += entity;
                }
                queue += @"&shipping_options=$(Serializable.array_to_string(arr))";
            }
            
            if (error_message != null)
                queue += @"&error_message=$error_message";
            
            return queue;
        }
    }
    
    public class AnswerPreCheckoutQueryConfig : BaseConfig {
        public string pre_checkout_query_id;
        public bool ok;
        public string? error_message;
        
        public override string method() {
            return "answerPreCheckoutQuery";
        }
        
        public override string queue() {
            var queue = @"pre_checkout_query_id=$pre_checkout_query_id&ok=$ok";
            
            if (error_message != null)
                queue += @"&error_message=$error_message";
            
            return queue;
        }
    }
    
    public class SendGameConfig : BaseConfig {
        public int64 chat_id;
        public string game_short_name;
        public bool? disable_notification;
        public int? reply_to_message_id;
        public bool? allow_sending_without_reply;
        public ReplyMarkup? reply_markup;
        
        public override string method() {
            return "sendGame";
        }
        
        public override string queue() {
            var queue = @"chat_id=$chat_id&game_short_name=$game_short_name";
            
            if (disable_notification != null)
                queue += @"&disable_notification=$disable_notification";
            
            if (reply_to_message_id != null)
                queue += @"&reply_to_message_id=$reply_to_message_id";
            
            if (allow_sending_without_reply != null)
                queue += @"&allow_sending_without_reply=$allow_sending_without_reply";
            
            if (reply_markup != null)
                queue += @"&reply_markup=$reply_markup";
            
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
    
    public enum ParseMode {
        MARKDOWN,
        MARKDOWNV2,
        HTML;
        
        public string to_string() {
            switch (this) {
                case MARKDOWN:
                    return "Markdown";
                case MARKDOWNV2:
                    return "MarkdownV2";
                case HTML:
                    return "HTML";
                default:
                    return "Undefined";
            }
        }
    }
    
    public abstract class BaseConfig {
        public abstract string method();
        public abstract string queue();
    }
    
    public abstract class UploadConfig : BaseConfig {
        public abstract bool has_attachments();
        public abstract async Soup.Multipart create_multipart() throws Error;
    }
}
