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


pal({7,135,10,15,143,9,137,142,14,8,136,2,141,130,133,0},1)
a=1b=1
cls()
_set_fps(60)
::♥::
for i=1,1024 do
local p=0x6000+rnd(8128)\1
poke(p+64,peek(p))
poke(p+1,peek(p))
end
pset(a,0,a\128+b)
a+=1
if a%128==0 then
b+=1
a=0
end
if b>=16 then
b=0
end
check_time()
flip()
goto ♥