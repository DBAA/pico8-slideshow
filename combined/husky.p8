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

--https://twitter.com/2DArray/status/1180945829948989441

p={0,10,1,6,4,5,7,1,6,5,8,2,7,5,9,6,8,7,9,8,11,9,10,12,7,11,6,11,6,12,5,13,6,15}::_::cls(7)for i=1,30,4 do
for z=0,1,.01 do
for j=0,1 do
a=p[i+j]b=p[i+j+2]c=p[i+j+4]d=a+z*(b-a)e=b+z*(c-b)f=d+z*(e-d)
if(j<1)x=f else y=f
end
pset(x*9,y*9+sin(t()/2+i/50))end
end
check_time()
flip()goto _
