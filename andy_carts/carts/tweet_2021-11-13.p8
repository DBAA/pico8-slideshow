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

--shimmer ribbons
pal({7,136,142},1)
::🔄::
e=t()
cls()
for k=0,2do
d=8+sin(e/5)*2
for c=0,140,d do
for r=0,140,d do
a=e+(c+r)/(200+sin(e/10)*100)
line(c+k,r-k,c+sin(a)*d+k,r+cos(a)*d,1+k)
end
end
end
check_time()
flip()goto 🔄
--#tweetcart #pico8 #pixelart


