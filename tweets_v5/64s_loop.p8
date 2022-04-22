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

--https://twitter.com/lexaloffle/status/1283001694616317956

::_::pal({14,12,10})
cls()for r=4,128,4 do
for i=0,7/4,1/4 do
q=(t()*(1+r/32)/8)%1
v0=mid(0,(q-i)*4,1)
v1=mid(0,(q-i)*4+2,1)
a=i-1/8
x=64+cos(a)*r*0.71
y=64+sin(a)*r*0.71
a+=3/8 u=cos(a) v=sin(a)
if(v1>v0)line(x+u*v0*r,y+v*v0*r,x+u*v1*r,y+v*v1*r,1+(r/16)%3)
end end
check_time()
flip()
goto _