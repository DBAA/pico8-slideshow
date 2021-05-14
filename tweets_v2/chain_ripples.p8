pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@picoter8 chain ripples
--https://twitter.com/picoter8/status/1329225930196332545

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


-- chain ripples #pico8 #tweetcart #tweetjam
::_::cls()
for j=-6,136,3do
for i=-6,136,3do
if(i+j)%6>=3then
x=64-i
y=64-j
p=(x*x+y*y)^.5
m=6*cos(p/80-t())
rectfill(i,j+m,i+1,j+3+m,7)
end
end
end
check_time()
flip()goto _