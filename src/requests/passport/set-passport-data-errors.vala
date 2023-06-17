namespace Telegram {
    
    public class SetPassportDataErrors : BaseRequest {
        public string user_id;
        public PassportElementError[] errors;
        
        public override string method() {
            return "setPassportDataErrors";
        }
        
        public override string queue() {
            var queue = @"user_id=$user_id";
            Serializable[] arr = {};
            foreach (var error in errors) {
                arr += error;
            }
            queue += @"&errors=$(Serializable.array_to_string(arr))";
            return queue;
        }
    }
}
