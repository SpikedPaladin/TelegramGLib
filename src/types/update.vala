namespace Telegram {
    
    public class Update {
        public int update_id;
        public Message? message;
        public Message? edited_message;
        public Message? channel_post;
        public Message? edited_channel_post;
        public InlineQuery? inline_query;
        public ChosenInlineResult? chosen_inline_result;
        public CallbackQuery? callback_query;
        public ShippingQuery? shipping_query;
        public PreCheckoutQuery? pre_checkout_query;
        public Poll? poll;
        public Poll.Answer? poll_answer;
        public ChatMemberUpdated? my_chat_member;
        public ChatMemberUpdated? chat_member;
        public ChatJoinRequest? chat_join_request;
        
        public Update(Json.Object object) {
            update_id = (int) object.get_int_member("update_id");
            if (object.has_member("message"))
                message = new Message(object.get_object_member("message"));
            
            if (object.has_member("edited_message"))
                edited_message = new Message(object.get_object_member("edited_message"));
            
            if (object.has_member("channel_post"))
                channel_post = new Message(object.get_object_member("channel_post"));
            
            if (object.has_member("edited_channel_post"))
                edited_channel_post = new Message(object.get_object_member("edited_channel_post"));
            
            if (object.has_member("inline_query"))
                inline_query = new InlineQuery(object.get_object_member("inline_query"));
            
            if (object.has_member("chosen_inline_result"))
                chosen_inline_result = new ChosenInlineResult(object.get_object_member("chosen_inline_result"));
            
            if (object.has_member("callback_query"))
                callback_query = new CallbackQuery(object.get_object_member("callback_query"));
            
            if (object.has_member("shipping_query"))
                shipping_query = new ShippingQuery(object.get_object_member("shipping_query"));
            
            if (object.has_member("pre_checkout_query"))
                pre_checkout_query = new PreCheckoutQuery(object.get_object_member("pre_checkout_query"));
            
            if (object.has_member("poll"))
                poll = new Poll(object.get_object_member("poll"));
            
            if (object.has_member("poll_answer"))
                poll_answer = new Poll.Answer(object.get_object_member("poll_answer"));
            
            if (object.has_member("my_chat_member"))
                my_chat_member = new ChatMemberUpdated(object.get_object_member("my_chat_member"));
            
            if (object.has_member("chat_member"))
                chat_member = new ChatMemberUpdated(object.get_object_member("chat_member"));
            
            if (object.has_member("chat_join_request"))
                chat_join_request = new ChatJoinRequest(object.get_object_member("chat_join_request"));
        }
    }
}
