pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--clothesline by @2darray

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


c={1,2,136,137,9,135,7,7}for i=1,8 do
pal(i-1,c[i],1)end
fillp(4680)q=circfill::_::cls()a=t()/4
for i=0,6 do
q(64,68,30-i*4,i*17+16)end
for z=60,4,-2 do
for x=-z,z do
c=mid(6.5-abs(x)/3,5,1)
q(64+x*64/z,64+64*(sin(a+(x+z)/20)+8)/z,96/z,c+flr(c+.5)*16)end
end
check_time()
flip()goto _
