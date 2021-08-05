pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://mobile.twitter.com/theoremnd/status/1312158415519588352

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

f=cos pal(13,135,1)::_::cls(1)n=t()/4o=0
for h=-8,152,48 do
for i=0,128,2 do
j=f(n+i/150)*12k=f(.5+n+i/150)*12
l=f(n-i/75)*12m=f(.5+n-i/75)*12
a=h+j+l b=h+k+l
line(i,a,i,b,12+o%3)d=h+k+m+24q=h+j+m+24
line(i+1,q,i+1,d,12+(o+1)%3)end o+=2end
check_time()
flip()goto _