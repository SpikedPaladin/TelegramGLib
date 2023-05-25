namespace Telegram.Types {
	
    public class ChatMemberRestricted : Object, ChatMember {
        public Status status;
        public User user;
        public bool is_member;
        public bool can_send_messages;
        public bool can_send_audios;
        public bool can_send_documents;
        public bool can_send_photos;
        public bool can_send_videos;
        public bool can_send_video_notes;
        public bool can_send_voice_notes;
        public bool can_send_polls;
        public bool can_send_other_messages;
        public bool can_add_web_page_previews;
        public bool can_change_info;
        public bool can_invite_users;
        public bool can_pin_messages;
        public bool can_manage_topics;
        public int64 until_date;
        
        public ChatMemberRestricted(Json.Object object) {
            status = Status.parse(object.get_string_member("status"));
            user = new User(object.get_object_member("user"));
            is_member = object.get_boolean_member("is_member");
            can_send_messages = object.get_boolean_member("can_send_messages");
            can_send_audios = object.get_boolean_member("can_send_audios");
            can_send_documents = object.get_boolean_member("can_send_documents");
            can_send_photos = object.get_boolean_member("can_send_photos");
            can_send_videos = object.get_boolean_member("can_send_videos");
            can_send_video_notes = object.get_boolean_member("can_send_video_notes");
            can_send_voice_notes = object.get_boolean_member("can_send_voice_notes");
            can_send_polls = object.get_boolean_member("can_send_polls");
            can_send_other_messages = object.get_boolean_member("can_send_other_messages");
            can_add_web_page_previews = object.get_boolean_member("can_add_web_page_previews");
            can_change_info = object.get_boolean_member("can_change_info");
            can_invite_users = object.get_boolean_member("can_invite_users");
            can_pin_messages = object.get_boolean_member("can_pin_messages");
            can_manage_topics = object.get_boolean_member("can_manage_topics");
            until_date = object.get_int_member("until_date");
        }
    }
}
