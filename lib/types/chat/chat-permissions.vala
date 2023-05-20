namespace Telegram.Types {
	
    public class ChatPermissions : Object, Serializable {
        public bool? can_send_messages;
        public bool? can_send_audios;
        public bool? can_send_documents;
        public bool? can_send_photos;
        public bool? can_send_videos;
        public bool? can_send_video_notes;
        public bool? can_send_voice_notes;
        public bool? can_send_polls;
        public bool? can_send_other_messages;
        public bool? can_add_web_page_previews;
        public bool? can_change_info;
        public bool? can_invite_users;
        public bool? can_pin_messages;
        public bool? can_manage_topics;
        
        public ChatPermissions(Json.Object object) {
            if (object.has_member("can_send_messages"))
                can_send_messages = object.get_boolean_member("can_send_messages");
            
            if (object.has_member("can_send_audios"))
                can_send_audios = object.get_boolean_member("can_send_audios");
            
            if (object.has_member("can_send_documents"))
                can_send_documents = object.get_boolean_member("can_send_documents");
            
            if (object.has_member("can_send_photos"))
                can_send_photos = object.get_boolean_member("can_send_photos");
            
            if (object.has_member("can_send_videos"))
                can_send_videos = object.get_boolean_member("can_send_videos");
            
            if (object.has_member("can_send_video_notes"))
                can_send_video_notes = object.get_boolean_member("can_send_video_notes");
            
            if (object.has_member("can_send_voice_notes"))
                can_send_voice_notes = object.get_boolean_member("can_send_voice_notes");
            
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
            
            if (object.has_member("can_manage_topics"))
                can_manage_topics = object.get_boolean_member("can_manage_topics");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            if (can_send_messages != null) {
                builder.set_member_name("can_send_messages");
                builder.add_boolean_value(can_send_messages);
            }
            
            if (can_send_audios != null) {
                builder.set_member_name("can_send_audios");
                builder.add_boolean_value(can_send_audios);
            }
            
            if (can_send_documents != null) {
                builder.set_member_name("can_send_documents");
                builder.add_boolean_value(can_send_documents);
            }
            
            if (can_send_photos != null) {
                builder.set_member_name("can_send_photos");
                builder.add_boolean_value(can_send_photos);
            }
            
            if (can_send_videos != null) {
                builder.set_member_name("can_send_videos");
                builder.add_boolean_value(can_send_videos);
            }
            
            if (can_send_video_notes != null) {
                builder.set_member_name("can_send_video_notes");
                builder.add_boolean_value(can_send_video_notes);
            }
            
            if (can_send_voice_notes != null) {
                builder.set_member_name("can_send_voice_notes");
                builder.add_boolean_value(can_send_voice_notes);
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
            
            if (can_manage_topics != null) {
                builder.set_member_name("can_manage_topics");
                builder.add_boolean_value(can_manage_topics);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
