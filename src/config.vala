namespace Telegram {
    
    /**
     * 
     */
    public struct BotConfig {
        /**
         * Limits the number of updates retrieved at a time. Values between 1-100 are accepted.  
         * Defaults to 100.
         */
        int? limit;
        /**
         * Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling.  
         * Should be positive, short polling should be used for testing purposes only.
         */
        int timeout;
        /**
         * List of the update types you want your bot to receive.  
         * For example, specify {{{{ message = true, edited_channel_post = true, callback_query = true }}}} to only receive updates of these types.  
         * See {@link UpdateConfig} for a complete list of available update types.
         * Specify an {@link UpdateConfig.empty} to receive all update types except chat_member (default).  
         * If not specified, the previous setting will be used.
         * Please note that this parameter doesn't affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
         */
        UpdateConfig? allowed_updates;
        /**
         * Enable debug log
         */
        bool debug;
        /**
         * Enable {@link GLib.MainLoop} creation inside bot
         * Don't change it if you're only running one {@link Bot} at a time
         */
        bool create_main_loop;
        
        public BotConfig() {
            timeout = 5;
        }
        
        public BotConfig.default() {
            timeout = 5;
            create_main_loop = true;
        }
    }
    
    public struct UpdateConfig {
        bool message;
        bool edited_message;
        bool channel_post;
        bool edited_channel_post;
        bool inline_query;
        bool chosen_inline_result;
        bool callback_query;
        bool shipping_query;
        bool pre_checkout_query;
        bool poll;
        bool poll_answer;
        bool my_chat_member;
        bool chat_member;
        bool chat_join_request;
        
        public UpdateConfig.empty() {}
        
        /**
         * Creates {@link UpdateConfig} with all update types enabled
         */
        public UpdateConfig.all_enabled() {
            message = true;
            edited_message = true;
            channel_post = true;
            edited_channel_post = true;
            inline_query = true;
            chosen_inline_result = true;
            callback_query = true;
            shipping_query = true;
            pre_checkout_query = true;
            poll = true;
            poll_answer = true;
            my_chat_member = true;
            chat_member = true;
            chat_join_request = true;
        }
        
        public string to_string() {
            var builder = new Json.Builder();
            
            builder.begin_array();
            
            if (message)
                builder.add_string_value("message");
            
            if (edited_message)
                builder.add_string_value("edited_message");
            
            if (channel_post)
                builder.add_string_value("channel_post");
            
            if (edited_channel_post)
                builder.add_string_value("edited_channel_post");
            
            if (inline_query)
                builder.add_string_value("inline_query");
            
            if (chosen_inline_result)
                builder.add_string_value("chosen_inline_result");
            
            if (callback_query)
                builder.add_string_value("callback_query");
            
            if (shipping_query)
                builder.add_string_value("shipping_query");
            
            if (pre_checkout_query)
                builder.add_string_value("pre_checkout_query");
            
            if (poll)
                builder.add_string_value("poll");
            
            if (poll_answer)
                builder.add_string_value("poll_answer");
            
            if (my_chat_member)
                builder.add_string_value("my_chat_member");
            
            if (chat_member)
                builder.add_string_value("chat_member");
            
            if (chat_join_request)
                builder.add_string_value("chat_join_request");
            
            builder.end_array();
            
            return Json.to_string(builder.get_root(), false);
        }
    }
}
