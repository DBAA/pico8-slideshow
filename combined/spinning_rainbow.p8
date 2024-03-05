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


l=line
pal({1,-15,-13,3,-5,11,-6,10,9,-7,8,-8},1)
b,c,r=64,64,60
::_::
cls()
for i=1,12 do
a=i*.041
x,y=b+cos(a)*r,c+sin(a)*r
u,v=b+cos(a+t()/5)*r,c+sin(a+.5+t()/5)*r
m,n=x-u,y-v
p=4/sqrt(m^2+n^2)
m*=p
n*=p
l(x,y,u,v,i)l(u+n,v-m)l(x+n,y-m)l(x,y)
end
check_time()
flip()
goto _