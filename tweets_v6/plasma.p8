pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/Theoremnd/status/1195879254828957698

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


pal(7,2)pal(5,0)pal(6,1)pal(11,7)fillp(0xa5a5)::_::w=128k=t()/8
for i=0,w,3 do
for j=0,w,3 do
y=cos((i/w)-k*2)*4-sin((i/w)+k*4)*2
x=sin((j/w)-k*2)*4-cos((j/w)+k*4)*2
h=(y+x)/2n=mid(5,7.5-h,11)c=mid(5,8-h,11)
rectfill(i,j,i+2,j+2,flr(c)*16+n)
end
end
check_time()
flip()goto _


