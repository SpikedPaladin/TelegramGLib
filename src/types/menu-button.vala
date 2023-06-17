namespace Telegram {
    
    public interface MenuButton : Object, Serializable {
    
        public static MenuButton from_json(Json.Object object) {
            Type type = Type.parse(object.get_string_member("type"));
            
            switch (type) {
                case COMMANDS:
                    return new MenuButtonCommands(object);
                case WEB_APP:
                    return new MenuButtonWebApp(object);
                default:
                    return new MenuButtonDefault(object);
            }
        }
        
        public enum Type {
            COMMANDS,
            WEB_APP,
            DEFAULT;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "commands":
                        return COMMANDS;
                    case "web_app":
                        return WEB_APP;
                    case "default":
                        return DEFAULT;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case COMMANDS:
                        return "commands";
                    case WEB_APP:
                        return "web_app";
                    case DEFAULT:
                        return "default";
                    default:
                        return "Undefined";
                }
            }
        }
    }
    
    public class MenuButtonCommands : Object, Serializable, MenuButton {
        public Type type;
        
        public MenuButtonCommands(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class MenuButtonWebApp : Object, Serializable, MenuButton {
        public Type type;
        public string text;
        public WebAppInfo web_app;
        
        public MenuButtonWebApp(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
            text = object.get_string_member("text");
            web_app = new WebAppInfo(object.get_object_member("web_app"));
        }
        
        public new Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.set_member_name("text");
            builder.add_string_value(text);
            
            builder.set_member_name("web_app");
            builder.add_value(web_app.serialize());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
    
    public class MenuButtonDefault : Object, Serializable, MenuButton {
        public Type type;
        
        public MenuButtonDefault(Json.Object object) {
            type = Type.parse(object.get_string_member("type"));
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("type");
            builder.add_string_value(type.to_string());
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
