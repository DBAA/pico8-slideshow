pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--gem tiles by @andy_makes
--https://twitter.com/andy_makes/status/1381801446916698118
-- 2021-04-12

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


pal({10,9,137,142,8,7,12,140,1,2},1)
::💎::
o=20*(t()%1)
cls(1)
for d=5,1,-1do
for c=-1,8do
for r=-1,8do
x=c*20
y=r*20
s=((d/5)^1.6)*(15+sin((x+y+o*2)*.005+t())*7)
rectfill(x-s+o,y-s+o,x+s+o,y+s+o,d+((c+r)%2)*5)
end
end
end
check_time()
flip()goto 💎
--#tweetcart #pico8 #generative #pixelart