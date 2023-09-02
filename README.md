# TelegramGLib [![Supported version](https://img.shields.io/badge/Telegram%20Bot%20API-6.8-blue)](https://core.telegram.org/bots/api#august-18-2023)
[![Telegram group badge](https://img.shields.io/badge/Telegram-Join_the_chat-2CA5E0?style=flat&logo=telegram)](https://t.me/vala_lang)  
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
        if (update.message != null && update.message.text != null) {
            bot.send.begin(new SendMessage() {
                chat_id = update.message.chat.id,
                reply_to_message_id = update.message.message_id,
                text = @"Your message: $(update.message.text)"
            });
        }
    };
    
    bot.start();
}
```

##### Compile with

    $ valac --pkg telegram-glib-0.3 main.vala
    $ ./main

<details><summary><b>Python</b></summary>

```python
import gi

gi.require_version('Telegram', '0.3')
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

