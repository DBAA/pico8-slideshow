pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/lucatron_/status/1081028654619025410

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


::_::
cls(1)
srand(34)
for y=0,141,3 do
 x=rnd(144)-8
 h=14+rnd(24)
 for i=0,h do
  circfill(x-i*2,y+2,(h-i)/6,0)
 end
 line(x,y,x,y+2,5)
 for i=-15,15 do
  line(x+i*h/80,y-abs(i)/6,x+sin(t()/5+x/150+y/200)/5*h,y-h,i>0 and 3 or 0)
 end
end
check_time()
flip()
goto _