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


t=0
p={2,130,10,9,137,8,136}
for i=1,#p do
pal(i,p[i],1)
end
::_::
cls()
t+=.005
for j=18,2,-1 do
for a=0,1,.008 do
r=6*j+j*sin(a*5+j/32)
b=a+t+j/64
x=64+r*cos(b)y=64+r*sin(b)
c=j/32-t
d=24-j
z=d*sin(c)w=d*cos(c)
circfill(x+w,y+z,2,1+j%7)
end
end
check_time()
flip()
goto _

