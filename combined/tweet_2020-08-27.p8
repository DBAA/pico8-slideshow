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

pal({7,11,138,13,141},1)t=0r=rnd::👻::
t+=.01for i=0,199 do
circ(r(128),r(128),3,0)end
for z=5,1,-1 do
for k=1,2.7,.3 do
x,y=64+sin(t*.9+k)*50,64+cos(t*k+k)*50
for i=0,z*20 do
a=r(1)p=(z/5)^2d=p*25+r(p*10)circfill(x+sin(a)*d,y+cos(a)*d,5-z,z)end
end
end
check_time()
flip()goto 👻
--#tweetcart