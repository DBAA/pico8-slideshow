pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/andy_makes/status/1406011489576759297
-- 2021-06-18

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

::_::cls()for d=0,6do
e=sin(t()/16+d/5)c=32+(d%2)*64r=12+flr(d/2)*64if(d>5)c,r=64,24
s=30+flr(d/6)*30for k=1,s do
for i=0,.75,.25do
a=c+k*sin(e+i)b=c+k*sin(e+i+.25)y=r+k
if a>b then 
line(a,y,b,y,4)for p=0,1,(k%9)/(9+k)do 
pset(p*a+(1-p)*b,y,8+d)end
end
end
end
end
check_time()
flip()goto _