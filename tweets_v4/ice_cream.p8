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


p={9,15,7,4,9}::_::cls()
for j=0,1 do
for i=0,1,.01 do
a=-i*3-t()/2
b=i*7-t()/2
r=4*(sqrt(i)-i)s=sin(a)c=cos(a)
z=p[flr(i*50%2)+4]
if(j>0)circfill(64+c*10*r,64+s*4*r-i*25,4*r+2,p[flr(s-c+1.5)+1])
if(j<1)circfill(64+cos(b)*i*7,92-i*30+sin(b)*2,4*i+1,z)
end
end
check_time()
flip()goto _
