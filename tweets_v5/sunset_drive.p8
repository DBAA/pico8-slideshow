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

--https://twitter.com/Theoremnd/status/1178885268763545605

t=0w=128s={}function c(y,c,d)add(s,{x=-9,y=y,h=y-rnd(25)-9,w=5,c=c,d=d})end::_::cls()circfill(64,41,31,8)for b in all(s) do
rectfill(b.x,b.h,b.x+b.w,b.y,b.c)b.x+=b.d
end
for i=0,w do
g=i*9+t%9line(g,72,g*3-w,w)h=i*i+68line(0,h,w,h)end
if(t%4<1)c(61,0,.5)c(72,2,1)
t+=1
check_time()
flip()goto _


