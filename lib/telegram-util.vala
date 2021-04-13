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
}
