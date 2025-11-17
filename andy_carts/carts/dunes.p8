pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://x.com/Andy_Makes/status/1458529658060877847
-- 2021-11-10

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


--dunes
pal({[0]=135,15,143,142,137,9,136,130},1)
::_::
cls()
for l=0,6do
for x=0,128do
e=x+t()*(9+15*l)
a=abs(sin(e/300))*30
b=20*cos(sin(e/1090+l/7)+cos(e/2200+sin(e/3500/l)))
p=.5+sin(e/8888+l/3)/2
line(x,l*20+(1-p)*a+p*b-15,x,128,1+l)
end
end
check_time()
flip()goto _
--#tweetcart #pico8