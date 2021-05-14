pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--bibliotech by @abemassry
--https://twitter.com/abemassry/status/1387959521495109634

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


--bibliotech
--#tweetcart
cls()b=16::_::
for i=1,5do
line(0,i*22,128,i*22,7)end
for y=0,128,2do
c=8+rnd(12)d=8+rnd(12)for a=0,5do
if(a%2==0)r=d
line(y,(a*22)+3,y,(a*22)+19,r)r=c
end
end
b-=1if(b==0)b=16
if b>5then
rectfill(0,0,128,17,0)rectfill(0,115,128,128,0)
end
check_time()
flip()goto _
