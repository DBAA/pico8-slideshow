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


--https://twitter.com/pixienop/status/1446826800877748226

pal({9,-7,-8,2,-3,12,-4,1,-15,-13,3,-5,11,-6,10,-9},1)s=sin::_::m=t()for d=-17,76do
c=64-s(m-d/50)*5for i=0,1,.05do
p=s(i-d/250)*s(d/50-i-m)v=c+s(i)*(20+d-p*5*(1+d/50))+s(d/50+i+m)*4b=64+cos(i)*(20+d+p*3*d/30)+cos(d*.01+i+m)*4if(i>0)line(x,y,v,b,p*8)
x,y=v,b
end
end
check_time()
flip()goto _

