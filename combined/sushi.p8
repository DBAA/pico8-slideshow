pico-8 cartridge // http://www.pico-8.com
version 29
__lua__


--@munrohoberman  sushi
--https://twitter.com/munrohoberman/status/1334510570670788609


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

::_::cls(12)for f=.02,.1,.08do
for i=0,1,f do
a=i+t()/8j=cos(a)*42+64k=sin(a)*42+64circfill(j,k,9,f<1and i*40%2+5)if(f>.02)then
a+=.25for g=0,4do
for z=0,1,.1do
x=j+cos(z)y=k-g+sin(z)f=g+2n=f*cos(a)m=f*sin(a)line(x+n,y+m,x-n,y-m,g<2and 7or i*9%3+8)end
end
end
end
end
check_time()
flip()goto _