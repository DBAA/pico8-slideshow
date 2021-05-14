pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@munrohoberman  cosmic horror
--https://twitter.com/munrohoberman/status/1293547797765951490

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

camera(-63,-63)c,s=circfill,sin
pal({129,1,131,139,138,11,135},1)::_::cls()n=t()for e=1,4do
for f=0,1,.1do
for z=1,3do
for i=1,15do
x,y=s(n+(i+e)/20)*17,9+i*i/2c(cos(f)*x-s(f)*y,s(f)*x+cos(f)*y,i/z,e+z)end
end
end
end
j,k=cos(n),s(n)c(j,k,2,12)c(s(n)*5.5+j,k,0,7)
check_time()
flip()goto _

