namespace Telegram.Util {
    
    public static string serialize_array(string[] array) {
        var builder = new Json.Builder();
        
        builder.begin_array();
        
        foreach (var element in array) {
            builder.add_string_value(element);
        }
        
        builder.end_array();
        
        return Json.to_string(builder.get_root(), false);
    }
    
    public static void log(LogLevel level, string message) {
	    print(color("2;37", "["));
        
        switch (level) {
            case LogLevel.DEBUG:
                print(color("1;36", "DEBUG"));
                break;
            case LogLevel.WARNING:
                print(color("1;33", "WARNING"));
                break;
            case LogLevel.ERROR:
                print(color("1;37;41", "ERROR"));
                break;
            case LogLevel.INFO:
                print(color("1;32", "INFO"));
                break;
        }
        
	    print(color("2;37", "]"));
	    print(@" $message\n");
    }
    
    public static string color(string code, string text) {
        return @"\033[$(code)m$text\033[m";
    }
    
    public enum LogLevel {
        DEBUG,
        WARNING,
        ERROR,
        INFO
    }
}
