pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--aeiou!!! by cbmakes
--https://twitter.com/cbmakes/status/1327698033971236864

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


s=0
poke(0x5f2c,3)
::_::
s+=0.1
c=cos(s/2)
d=cos(s/15)*10
cls()
ovalfill(-10,40,74,99,6)
line(31,35,30,40,1)
for i=1,3 do
line(32,34+i,35+c/4,35+i+c,7+i%2)
end
?"aeiou!",22,10+c/2,7
?"웃",19,28+d,7
?"웃",40,32+d/1.5,7
rectfill(32,35,33,36,12)
flip()
check_time()
goto _

