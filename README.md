# pico8-slideshow
pico8 app for launching tweetcarts


How to set this up:

In the pico-pi SD card

Move rom.p8 to root

Move hub.p8 and the current tweets folder to /pico-8/carts

If a cart does not use `flip()` you may need to call `flip()` once when it first launches otherwise it will not push to the screen until you exit. Calling `cls()` might also help.