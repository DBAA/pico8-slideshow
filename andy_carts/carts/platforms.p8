pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://x.com/Andy_Makes/status/1510280154509152262
-- 2022-04-02

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

--https://twitter.com/Andy_Makes/status/1510280154509152262

g=139pal({14,138,12,8,g,140,2,131,1},1)::_::cls()s=10for y=-g,g,s do
for x=g+y%s,-30,-20do
srand(x+y*9)h=y+max(sin(t()/5+rnd()),-.5)*30c=rnd(3)rectfill(x,h,x+s,g,c+4)rectfill(x+s,h+s,x+30,g,c+7)for i=0,s do
line(x+i,h+i,x+i+20,h+i,c+1)end
end
end
check_time()
flip()goto _
--#tweetcart #pico8