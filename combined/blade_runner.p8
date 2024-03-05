pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/von_rostock/status/1611903208003182593

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

--#genuary7 #pico8 #tweetcart
flip()
s=sin?"\^!5f111▒1⬇️1▒0✽49:♥77"
::_::x=rnd(-1)>>9y=rnd(-1)>>9a=atan2(x,y)d=(x*x+y*y)^.5k=d/12+s(a*32)*(1-d/64)+d%1if(d<24)k=0
if(x<0)u=d/99v=a+t()/64g=.6e=0for i=1,3do g*=2k-=abs(.4^i*(s(2^i*u+s(g*v)/2)+s(s(g*u)/2)))*x/7end
pset(64+x,64+y,k)check_time()goto _

