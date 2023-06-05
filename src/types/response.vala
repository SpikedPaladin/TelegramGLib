namespace Telegram {
    
    public class Response {
        public bool ok;
        public Json.Node? result;
        public string? description;
        public int? error_code;
        
        public Response(Json.Object object) {
            ok = object.get_boolean_member("ok");
            
            if (object.has_member("result"))
                result = object.get_member("result");
            
            if (object.has_member("description"))
                description = object.get_string_member("description");
            
            if (object.has_member("error_code"))
                error_code = (int) object.get_int_member("error_code");
        }
    }
}
