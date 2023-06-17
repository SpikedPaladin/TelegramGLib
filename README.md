# TelegramGLib [![Supported version](https://img.shields.io/badge/Telegram%20Bot%20API-6.7-blue)](https://core.telegram.org/bots/api-changelog#april-21-2023)
[![Chat on telegram](https://img.shields.io/badge/chat-on%20telegram-0088cc.svg)](http://t.me/vala_lang)  
[![lines](https://img.shields.io/tokei/lines/github/SpikedPaladin/TelegramGLib)](https://github.com/SpikedPaladin/TelegramGLib)  
TelegramGLib is a bot api for telegram written in Vala

## Features
- Inline mode support
- Async request sending
- File uploading
- Android support

## Sample

#### Vala
```vala
using Telegram;

void main() {
    var bot = new Bot() {
        token = "YOUR_BOT_TOKEN"
    };
    
    bot.update = update => {
        if (update.message != null && message.text != null) {
            bot.send.begin(new SendMessage() {
                chat_id = message.chat.id,
                reply_to_message_id = message.message_id,
                text = @"Your message: $(message.text)"
            });
        }
    };
    
    bot.start();
}
```

##### Compile with

    $ valac --pkg telegram-glib-0.3 main.vala
    $ ./main

##### Result
![Screenshot](./result.png)

##### More examples

* [TelegramGLib-Examples](https://github.com/SpikedPaladin/TelegramGLib-Examples) repository

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

**[Installation for Android (Guide)](https://gist.github.com/SpikedPaladin/c51d95773fa851c6e54e8ae1cf4e5b10)**

#### Dependencies
> json-glib-1.0  
> libsoup-3.0

#### Build manualy

    $ meson setup --prefix=/usr build
    $ cd build
    $ ninja install

## TODO
- [ ] Webhook support
- [ ] Write documentation
- [ ] Telegram passport support

