pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@gregosel city life
--https://twitter.com/gregosel/status/1391063991234007044

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


--city life
cls()f=1.5o=128r=rnd
j=40k=99::_::
if(btnp()>0)j=r(o)k=r(o)
circfill(r(o),r(o),4,r(16))
for n=0,900 do
x=r(o)y=r(o)i=pget(x,y)
v=j+1.5*(x-j)w=k+f*(y-k)
if(r()<.1)i="0x"..sub("001121d6449cd58e",i+1,i+1)
line(x,y,v+r(),w+r(),i)
end
f=mid(1.05,f+r(.04)-.02,3)
check_time()
flip()goto _