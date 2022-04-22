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

--https://twitter.com/GunTurtle/status/1346839766575292420?s=20

pal({128,130,2,136,8,-2,-1,15,7},1)
f=pget
l=0g=0::_::
l+=1if(l>g)memcpy(24640,24576,8127)g+=.5l=0
if g>=4then
g=0w=0
for x=-1,150,8do
q=w w=rnd(9)for u=0,7do
for v=0,7do
a=q-v*(q-f(x,8))/8pset(x+u,v,max(a+u*(w-v*(w-f(x+8,8))/8-a)/8+rnd()))end
end
flip()end
end
check_time()
flip()goto _

