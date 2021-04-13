# TelegramGLib
[![Chat on telegram](https://img.shields.io/badge/chat-on%20telegram-0088cc.svg)](http://t.me/TgGLib)  
TelegramGLib is a bot api for telegram written in Vala

## Features
- Async request sending
- File uploading

## Sample
```vala
using Telegram.Configs;
using Telegram.Types;
using Telegram;

void main() {
	var bot = new ReadMeBot();
	bot.start();
	new MainLoop().run();
}

public class ReadMeBot : Bot {
    
    construct {
        // Token from variable:
        // token = Environment.get_variable("TOKEN");
        token = "YOUR_BOT_TOKEN";
    }
    
    public override void update_recieved(Update update) {
        if (update.message != null && update.message.text != null) {
            var msg = new SendMessageConfig();
            msg.chat_id = update.message.chat.id;
            msg.reply_to_message_id = update.message.message_id;
            msg.text = @"Your message: $(update.message.text)";
            
            send.begin(msg);
        }
    }
}
```

**Compile with**

    $ valac --pkg telegram-glib-0.1 main.vala
    $ ./main

## Uploading files
```vala
var config = new SendPhotoConfig();
config.chat_id = update.message.chat.id;
// To upload local file use prefix 'file://'
// File will be uploaded from local folder (/home/paladin/Pictures/upload.jpg)
config.photo = "file:///home/paladin/Pictures/upload.jpg";

send.begin(config);
```

### Installation
    $ meson --prefix=/usr _build
    $ cd _build
    $ ninja install

##### TODO
- [ ] Inline mode configs
- [ ] Webhook support
- [ ] Write documentation
- [ ] Create android guide
- [ ] Add GIR output