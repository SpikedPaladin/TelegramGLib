namespace Telegram.Types {
	
    public class InlineKeyboardButton : Object, Serializable {
        public string text;
        public string? url;
        public string? callback_data;
        public WebAppInfo? web_app;
        public LoginUrl? login_url;
        public string? switch_inline_query;
        public string? switch_inline_query_current_chat;
        public SwitchInlineQueryChosenChat? switch_inline_query_chosen_chat;
        public CallbackGame? callback_game;
        public bool? pay;
        
        public InlineKeyboardButton(Json.Object? object = null) {
            if (object != null) {
                text = object.get_string_member("text");
                
                if (object.has_member("url"))
                    url = object.get_string_member("url");
                
                if (object.has_member("callback_data"))
                    callback_data = object.get_string_member("callback_data");
                
                if (object.has_member("web_app"))
                    web_app = new WebAppInfo(object.get_object_member("web_app"));
                
                if (object.has_member("login_url"))
                    login_url = new LoginUrl(object.get_object_member("login_url"));
                
                if (object.has_member("switch_inline_query"))
                    switch_inline_query = object.get_string_member("switch_inline_query");
                
                if (object.has_member("switch_inline_query_current_chat"))
                    switch_inline_query_current_chat = object.get_string_member("switch_inline_query_current_chat");
                
                if (object.has_member("switch_inline_query_chosen_chat"))
                    switch_inline_query_chosen_chat = new SwitchInlineQueryChosenChat(object.get_object_member("switch_inline_query_chosen_chat"));
                
                if (object.has_member("callback_game"))
                    callback_game = new CallbackGame();
                
                if (object.has_member("pay"))
                    pay = object.get_boolean_member("pay");
            }
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("text")
                   .add_string_value(text);
            
            if (url != null) {
                builder.set_member_name("url");
                builder.add_string_value(url);
            }
            
            if (callback_data != null) {
                builder.set_member_name("callback_data");
                builder.add_string_value(callback_data);
            }
            
            if (web_app != null) {
                builder.set_member_name("web_app");
                builder.add_value(web_app.serialize());
            }
            
            if (login_url != null) {
                builder.set_member_name("login_url");
                builder.add_value(login_url.serialize());
            }
            
            if (switch_inline_query != null) {
                builder.set_member_name("switch_inline_query");
                builder.add_string_value(switch_inline_query);
            }
            
            if (switch_inline_query_current_chat != null) {
                builder.set_member_name("switch_inline_query_current_chat");
                builder.add_string_value(switch_inline_query_current_chat);
            }
            
            if (switch_inline_query_chosen_chat != null) {
                builder.set_member_name("switch_inline_query_chosen_chat");
                builder.add_value(switch_inline_query_chosen_chat.serialize());
            }
            
            if (callback_game != null) {
                builder.set_member_name("callback_game");
                builder.begin_object().end_object();
            }
            
            if (pay != null) {
                builder.set_member_name("pay");
                builder.add_boolean_value(pay);
            }
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
