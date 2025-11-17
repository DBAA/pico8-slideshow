pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://x.com/Andy_Makes/status/1443020876891447297
-- 2021-09-28

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


--taffy pull
pal({14,13,137,131},1)::_::e=t()cls(4)
for x=10,118do
y=14+sin(x/63+e)*4
o=y
for d=0,4do
g=d%2*2-1
srand(x-flr(e*5*(3-d/2))*g)
c=1+rnd(4)
l=15+sin(x/51+e/(d+1)/2)*7
b=y+l
if(d>3)b=128-o
if(y<b)line(x,y,x,b,c)
y=y+l+4
end
end
check_time()
flip()goto _
--#tweetcart #pico8 #pixelart
