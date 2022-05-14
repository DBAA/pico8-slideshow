# pico8-slideshow
pico8 app for launching tweetcarts


How to set this up:

In the pico-pi SD card

Move rom.p8 to root

Move everything else (hub.p8 and the tweets folder) to /pico-8/carts

Do not copy blank.p8 to the SD card. That is just for use when making new carts.

If a cart does not use `flip()` you may need to call `flip()` once when it first launches otherwise it will not push to the screen until you exit. Calling `cls()` might also help.