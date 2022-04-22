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

cls()fillp(▒\1)pal({-4,12,6,7,7,7,-13,3,-5,-6},1)s=sin::_::x=rnd(128)m=78+s(x/192)*8y=rnd(96)w=x/6
if(y<m)n=1w=x/2+t()*2
g=y/512k=0for i=0,6do g*=2k+=.6^i*(s(s(g/2)/2-g*w/y)+s(g))end
k=abs(k^3)+7
if(y<m)k=min(k/4-7/4,4)+1
if(y>93)k=1
pset(x,16+y,k+(k+.5)\1*16)
check_time()
goto _
