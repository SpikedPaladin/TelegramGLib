namespace Telegram {
    
    public class SetMyDefaultAdministratorRights : BaseRequest {
        public ChatAdministratorRights? rights;
        public bool? for_channels;
        
        public override string method() {
            return "setMyDefaultAdministratorRights";
        }
        
        public override string queue() {
            var queue = "";
            
            if (rights != null)
                queue += @"&rights=$rights";
            
            if (for_channels != null)
                queue += @"&for_channels=$for_channels";
            
            return queue;
        }
    }
}
