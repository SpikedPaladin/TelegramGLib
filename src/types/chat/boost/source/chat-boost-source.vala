namespace Telegram {
    
    public interface ChatBoostSource : Object {
        
        public static ChatBoostSource from_json(Json.Object object) {
            var source = Source.parse(object.get_string_member("source"));
            
            switch (source) {
                case Source.GIFT_CODE:
                    return new ChatBoostSourceGiftCode(object);
                case Source.GIVEAWAY:
                    return new ChatBoostSourceGiveaway(object);
                default:
                    return new ChatBoostSourcePremium(object);
            }
        }
        
        public enum Source {
            PREMIUM,
            GIFT_CODE,
            GIVEAWAY;
            
            public static Source? parse(string status) {
                switch (status) {
                    case "premium":
                        return PREMIUM;
                    case "gift_code":
                        return GIFT_CODE;
                    case "giveaway":
                        return GIVEAWAY;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case PREMIUM:
                        return "premium";
                    case GIFT_CODE:
                        return "gift_code";
                    case GIVEAWAY:
                        return "giveaway";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}