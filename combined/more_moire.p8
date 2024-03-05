pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/GunTurtle/status/1341890839069528065?s=20 

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


d={30583.5,-17476.5,-8738.5,-4369.5}t=0::_::
t+=0.5q=circfill
cls(6)for l=1,8do
for i=1,4do
fillp(d[i])q(64,64,32-i*4,0x71)q(64+cos(l/8+i/32)*48,64+sin(l/8+i/32)*48,4)
end
end
fillp()for j=1,31do
v=j*4-t%256+128rectfill(v,0,v+2,128,1)end
check_time()
flip()goto _


