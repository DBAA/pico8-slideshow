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

cls()
flip()
::🖌::
x=rnd(128)y=rnd(128)
if(pget(x,y)==0and x%2<1)pset(x,y-1,0)
if(pget(x,y)==0and y%2<1)pset(x+1,y,0)
if(pget(x,y)==7and x%2>1)pset(x,y+1,7)
for i=0,1 do
d=73-i*18a=-t()/15+i*.5s=12-4*i
circfill(64+cos(a)*d,65+sin(a)*d,s,7*i)
end
check_time()
goto 🖌
--#tweetcart #pixelart #pico8
