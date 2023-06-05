namespace Telegram {
    
    public class ChatInviteLink {
        public string invite_link;
        public User creator;
        public bool creates_join_request;
        public bool is_primary;
        public bool is_revoked;
        public string? name;
        public int64? expire_date;
        public int? member_limit;
        public int? pending_join_request_count;
        
        public ChatInviteLink(Json.Object object) {
            invite_link = object.get_string_member("invite_link");
            creator = new User(object.get_object_member("creator"));
            creates_join_request = object.get_boolean_member("creates_join_request");
            is_primary = object.get_boolean_member("is_primary");
            is_revoked = object.get_boolean_member("is_revoked");
            
            if (object.has_member("name"))
                name = object.get_string_member("name");
            
            if (object.has_member("expire_date"))
                expire_date = object.get_int_member("expire_date");
            
            if (object.has_member("member_limit"))
                member_limit = (int) object.get_int_member("member_limit");
            
            if (object.has_member("pending_join_request_count"))
                pending_join_request_count = (int) object.get_int_member("pending_join_request_count");
        }
    }
}
