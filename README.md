# TelegramGLib [![Supported version](https://img.shields.io/badge/Telegram%20Bot%20API-6.7-blue)](https://core.telegram.org/bots/api-changelog#april-21-2023)
[![Chat on telegram](https://img.shields.io/badge/chat-on%20telegram-0088cc.svg)](http://t.me/codefaq)  
[![lines](https://img.shields.io/tokei/lines/github/SpikedPaladin/TelegramGLib)](https://github.com/SpikedPaladin/TelegramGLib)  
TelegramGLib is a bot api for telegram written in Vala

## Features
- Inline mode support
- Async request sending
- File uploading

## Sample

#### Vala
```vala
using Telegram.Requests;
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
        
        // Debug mode.
        debug = true;
    }
    
    public override void update_recieved(Update update) {
        if (update.message != null && update.message.text != null) {
            var msg = new SendMessage();
            msg.chat_id = update.message.chat.id;
            msg.reply_to_message_id = update.message.message_id;
            msg.text = @"Your message: $(update.message.text)";
            
            send.begin(msg);
        }
    }
}
```

##### Compile with

    $ valac --pkg telegram-glib-0.2 main.vala
    $ ./main

##### Result
![Screenshot](./result.png)

## Uploading files
```vala
var request = new SendPhoto();
request.chat_id = update.message.chat.id;
// To upload local file use prefix 'file://'
// File will be uploaded from local folder (/home/paladin/Pictures/upload.jpg)
request.photo = "file:///home/paladin/Pictures/upload.jpg";

send.begin(request);
```

## Installation

#### Dependencies
> json-glib-1.0  
> libsoup-3.0  
> gee-0.8

#### Build manualy

    $ meson --prefix=/usr _build
    $ cd _build
    $ ninja install

## TODO
- [ ] Webhook support
- [ ] Write documentation
- [ ] Create android guide
- [ ] Telegram passport support

