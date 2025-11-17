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


pal({1,2,136,142,11,9},1)
cls()flip()
for x=0,128do
for y=0,128do
pset(x,y, (x+y/7)%3)
end
end
::_::
p=25
o=128-p*2
x=p+rnd(o)
y=p+rnd(o)
v=0
for r=p,128-p,5 do
c=64+sin(t()/4+r/99)*70
xd=abs(x-c)
if(xd<p and abs(y-r) < p-xd/2)v+=1
end
pset(x,y,v)
check_time()
goto _
--#tweetcart #pico8 #pixelart
