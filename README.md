# TelegramGLib [![Supported version](https://img.shields.io/badge/Telegram%20Bot%20API-7.0-blue)](https://core.telegram.org/bots/api#december-29-2023)
[![Telegram group badge](https://img.shields.io/badge/Telegram-Join_the_chat-2CA5E0?style=flat&logo=telegram)](https://t.me/vala_lang)  
[![lines](https://img.shields.io/tokei/lines/github/SpikedPaladin/TelegramGLib)](https://github.com/SpikedPaladin/TelegramGLib)  
TelegramGLib is a bot api for telegram written in Vala

## Features
- Inline mode support
- Async request sending
- File uploading
- Handlers support
- Android support

## Sample

#### Vala
```vala
using Telegram;

void main() {
    var bot = new Bot() {
        token = "YOUR_BOT_TOKEN"
    };
    
    // Reply to message with text 'priority'
    // This MessageHandler will have more priority because
    // It was added before handler which replies on any message
    bot.add_handler(new MessageHandler("priority", msg => {
        bot.send.begin(new SendMessage() {
            chat_id = msg.chat.id,
            text = "Handler priority example"
        });
    }));
    
    // Reply to any message
    // Except handlers with same type added before this
    bot.add_handler(new MessageHandler(null, msg => {
        bot.send.begin(new SendMessage() {
            chat_id = msg.chat.id,
            text = @"Your message: $(msg.text)"
        });
    }));
    
    // Send greeting message if user started bot
    bot.add_handler(new CommandHandler("start", msg => {
        bot.send.begin(new SendMessage() {
            chat_id = msg.chat.id,
            text = "Welcome!"
        });
    // Check if chat is private
    }, msg => msg.chat.type == Chat.Type.PRIVATE));
    
    bot.start();
}
```

##### Compile with

    $ valac --pkg telegram-glib-1.0 main.vala
    $ ./main

<details><summary><b>Python</b></summary>

```python
import gi

gi.require_version('Telegram', '1.0')
from gi.repository import Telegram

class PingBot(Telegram.Bot):
    
    def __init__(self, **kargs):
        super().__init__(**kargs)
        self.token = 'YOUR_BOT_TOKEN'
    
    def do_on_message(self, message):
        if message.text is not None:
            msg = Telegram.SendMessage()
            msg.chat_id = message.chat.id
            msg.text = 'Your message: ' + message.text
            
            self.send(msg)
        
        return True

bot = PingBot()
bot.start()
```
</details>

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

### ArchLinux
Download TelegramGLib from AUR

    $ yay -S telegram-glib

### Build manualy

#### Dependencies
> json-glib-1.0  
> libsoup-3.0

#### Installing

    $ meson setup --prefix=/usr build
    $ ninja -C build install

## TODO
- [ ] Webhook support
- [ ] Write documentation
- [ ] Telegram passport support
