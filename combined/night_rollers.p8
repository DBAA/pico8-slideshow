pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/Andy_Makes/status/1405305042039619585

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

--night rollers
pal({10,137,8,11,12,9,130},1)
::_::
cls(7)
e=(t()/4)%1
s=10
for d=1,6 do
for c=0-e*60,178,s do
for r=0-e*120,178,s do
a=sin(e)/4+.75+(c+r)/99+d/(50+sin(e)*20)
circ(c+cos(a)*9,r+sin(a)*9+d-20,1,d)
end
end
end
check_time()
flip()goto _
--#tweetcart #pico8 #pixelart #loop