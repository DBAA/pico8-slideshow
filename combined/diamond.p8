pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

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

--#tweetcart #pico8
for i=0,15 do
pal(i,8.5+i*128.49,1)
end

::★::
for i=0,1999 do
x=rnd(128)
y=rnd(128)
n=(abs(x-64)+abs(y-64))/8-t()*2
c=(pget(x-1,y)+rnd(1.1)-n)%2+n
circ(x,y,1,c%16)
end
memcpy(0x6000,0x6040,0x1fc0)
memcpy(0x7fc0,0x6000,0x40)
check_time()
flip()goto ★
