pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/pixienop/status/1196619234542903296

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


::w::cls(1)st=t()
for y=90,127 do
for x=0,127 do
local dfc=-(x-64)/64local d=(y-90)/(127-90)local c=7
local dte=0
if flr(d*10)%2==0 then
dte=.5
end
if sin(st*5+dte+x*.1+d*dfc*5)<0 then
c=0
end
pset(x,y,c)end end
circfill(64,100-abs(sin(st/4)*49.9),20,8+st/2)
check_time()
flip()goto w