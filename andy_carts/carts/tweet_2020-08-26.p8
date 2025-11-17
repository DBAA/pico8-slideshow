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

pal({5,14,8,9,10,7},1)cls(0)t=0p=pset
r=rnd::🔥::
t+=.01x=64+sin(t)*40z=1+cos(t)*.5w=sin(3*t)*z*30oval(x,50,x+w,60+30*z,2)for y=0,128do
for x=0,128do
c=pget(x,y)if c>1then
if(c!=2or r(9)<1)p(x,y,0)
p(x-1+r(3),y-r(2),(c+1)%7)
if(r(9)<2and c>1)p(x,y-3,c)
end
end
end
check_time()
flip()goto 🔥
--#tweetcart
