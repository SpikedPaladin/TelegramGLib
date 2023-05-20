namespace Telegram.Types {
	
    public class Poll {
        public string id;
        public string question;
        public Option[] options;
        public int total_voter_count;
        public bool is_closed;
        public bool is_anonymous;
        public Type type;
        public bool allows_multiple_answers;
        public int? correct_option_id;
        public string? explanation;
        public MessageEntity[]? explanation_entities;
        public int? open_period;
        public int64? close_date;
        
        public Poll(Json.Object object) {
            id = object.get_string_member("id");
            question = object.get_string_member("question");
            
            Option[] temp_options = {};
            foreach (var element in object.get_array_member("options").get_elements()) {
                temp_options += new Option(element.get_object());
            }
            options = temp_options;
            
            total_voter_count = (int) object.get_int_member("total_voter_count");
            is_closed = object.get_boolean_member("is_closed");
            is_anonymous = object.get_boolean_member("is_anonymous");
            type = Type.parse(object.get_string_member("type"));
            allows_multiple_answers = object.get_boolean_member("allows_multiple_answers");
            
            if (object.has_member("correct_option_id"))
                correct_option_id = (int) object.get_int_member("correct_option_id");
            
            if (object.has_member("explanation"))
                explanation = object.get_string_member("explanation");
            
            if (object.has_member("explanation_entities")) {
                MessageEntity[] temp = {};
                foreach (var element in object.get_array_member("entities").get_elements()) {
                    temp += new MessageEntity(element.get_object());
                }
                explanation_entities = temp;
            }
            
            if (object.has_member("open_period"))
                open_period = (int) object.get_int_member("open_period");
            
            if (object.has_member("close_date"))
                close_date = object.get_int_member("close_date");
        }
        
        public class Answer {
            public string poll_id;
            public User user;
            public int[] option_ids;
            
            public Answer(Json.Object object) {
                poll_id = object.get_string_member("poll_id");
                user = new User(object.get_object_member("user"));
                
                int[] temp_option_ids = {};
                foreach (var element in object.get_array_member("option_ids").get_elements()) {
                    temp_option_ids += (int) element.get_int();
                }
                option_ids = temp_option_ids;
            }
        }
        
        public class Option {
            public string text;
            public int voter_count;
            
            public Option(Json.Object object) {
                text = object.get_string_member("text");
                voter_count = (int) object.get_int_member("voter_count");
            }
        }
        
        public enum Type {
            REGULAR,
            QUIZ;
            
            public static Type? parse(string type) {
                switch (type) {
                    case "private":
                        return REGULAR;
                    case "group":
                        return QUIZ;
                    default:
                        return null;
                }
            }
            
            public string to_string() {
                switch (this) {
                    case REGULAR:
                        return "regular";
                    case QUIZ:
                        return "quiz";
                    default:
                        return "Undefined";
                }
            }
        }
    }
}
