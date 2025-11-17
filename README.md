# pico8-slideshow
pico8 app for launching tweetcarts


# Thank you to all #tweetcart artists
All of these carts are from different artists and were shown in the #tweetcart gallery at [Wonderville](https://www.wonderville.nyc/) in NYC.

Each cart should have a link to the source, but if not you can search some of the source code in twitter to find them.

# How to set this up

In the pico-pi SD card

Move rom.p8 to root

Move hub.p8 and the current tweets folder to /pico-8/carts


# Quick and Dirty Explanation of how this works

* rom.p8 launches the hub (we were running it using pico-pi, which checks root for rom.p8 on startup)
* hub.p8 launches the cart and provides some breadcrumbs
* all tweetcarts get some added code at the top to make them bounce back to hub after X seconds

```
--[[
  put this check_time function at the start of the cart
  make sure to call check_time() somehwere in the cart.
  in most tweetcarts, the bast place to do this is direclty before "flip()"
--]]
function check_time() 
  --id is stored in the parameters field
  my_id = stat(6)

  --the breadcrumb field is the name of the start cart + "," + the number of seconds we should play
  my_info = stat(100)
  --if we don't have it, stop checking
  if my_info == nil then
    return
  end

  breadcumb_parts = split(my_info, ",", true)
  start_cart_name = breadcumb_parts[1]
  max_time = breadcumb_parts[2]

  --check if we hit the max time
  if time() > max_time or btnp(1) then
    load(start_cart_name,"",my_id)
  end
end
--end of check_time
```

If a cart does not use `flip()` you may need to call `flip()` once when it first launches otherwise it will not push to the screen until you exit. Calling `cls()` might also help.