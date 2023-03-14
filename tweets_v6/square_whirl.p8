pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/picoter8/status/1328936412767547402

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



::_::cls()
for j=-16,144,3do
for i=-16,144,3do
if(i+j)%6>=3then
x=64-i
y=64-j
m=(x*x+y*y)^.5
a=atan2(x,y)+t()
n=3*cos(m/64+a)
m=3*sin(m/32+a)
rectfill(i+n,j+m,i+2+n,j+2+m,7+m/4)
end
end
end
check_time()
flip()goto _