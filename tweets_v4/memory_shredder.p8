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


poke(▒|▤,웃/●)pal({-13,-3,-6,-12,-11,-14,-15,-8,-2,-9,-5,-4,-7,-1,-10},2)o=0r=.1_set_fps(60)z=rnd
a=poke
n=btnp
j=●-웃::_::
o-=r
if(n(2))r+=.01
if(n(3))r-=.01 
for i=0,4^5do
p=j+z()*8192q=j+z()*4^6a(p,p/4^4-o)a(p+.01,p/4^4-o)memcpy(q,p,1)end
memset(81-😐,170,16)
check_time()
flip()
goto _