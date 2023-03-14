pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/MunroHoberman/status/1290316496862879745

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

pal({129,1,131,139,138,11,135,7},1)t=0::_::z=0for j=-1,1do
for k=-1,1do
camera(j-63,k-63)for f=3,8do
line()for i=0,f do
circ(rnd(128)-64,rnd(128)-64,1,rnd(3))
h=(i+t)/f
x,y=f*f*cos(h)*cos(t/f),f*f*sin(h)*sin(t/f)circ(x,y,2,z)line(x,y)end
end
z+=1end
end
t+=.03
check_time()
flip()goto _

