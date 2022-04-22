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

_set_fps(60)pal({0,-15,-13,-8,3,-5,-6,-6,11},1)poke(24364,7)e=rnd::_::r=t()/5
if(flr(r*5)%5<1)s=e(-1)
srand(s)
for i=1,25do
q=sin(r)pset(q*i*e(3)+68,cos(r)*q*i*e(4)+68,9)end
for x=1,128,4do
for y=1,128,4do
x=e(128)y=e(128)circ(x,y,e(5),abs(pget(x,y)-1))end
end
check_time()
flip()
goto _

