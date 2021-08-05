pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/gunturtle/status/1326169532671647751?s=20

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


--#pico8 #tweetcart
::_::cls(8)pal(8,1,1)r=time()/16
camera(-64,-64)poke(0x5f5e,255)for l=0,1 do
for j=-7.5,7.5,.5 do
for i=-7,7,.5 do
s=i*16+j%2*8
d=j*14
e=(s^2+d^2)^.5
f=atan2(d,s)+r*l
circfill(cos(f)*e+sin(r/2)*32*l,sin(f)*e,2,6-l)end
end
poke(0x5f5e,247)end
check_time()
flip()goto _