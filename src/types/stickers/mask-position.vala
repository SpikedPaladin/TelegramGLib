namespace Telegram {
    
    public class MaskPosition : Object, Serializable {
        public string point;
        public double x_shift;
        public double y_shift;
        public double scale;
        
        public MaskPosition(Json.Object object) {
            point = object.get_string_member("point");
            x_shift = object.get_double_member("x_shift");
            y_shift = object.get_double_member("y_shift");
            scale = object.get_double_member("scale");
        }
        
        public Json.Node serialize() {
            var builder = new Json.Builder();
            
            builder.begin_object();
            
            builder.set_member_name("point");
            builder.add_string_value(point);
            
            builder.set_member_name("x_shift");
            builder.add_double_value(x_shift);
            
            builder.set_member_name("y_shift");
            builder.add_double_value(y_shift);
            
            builder.set_member_name("scale");
            builder.add_double_value(scale);
            
            builder.end_object();
            
            return builder.get_root();
        }
    }
}
