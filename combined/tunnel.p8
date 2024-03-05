pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/twitonatrain/status/1605567549113962496

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

for x=-64,64 do
for y=-64,64 do
u=x/64v=y/64m=sqrt(u^2+v^2+1)
u=u/m
v=v/m
z=1/m
t=sqrt(1/(u^2+v^2))
l=z*t
v=l%1*7
a=atan2(x,y)
j=l%1*7
c=a%.125>.0625 and j+v or j+v+7
c%=14
c+=1
if(l<9)pset(64+x,64+y,c)
end
end
p={10,7,7,7,7,7,12,1,0,0,0,0,0,2}::_::add(p,deli(p,1))pal(p,1)check_time()flip()goto _