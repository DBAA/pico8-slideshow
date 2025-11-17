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



cls()h=64s=sin::_::e=t()/5for i=0,500do
pset(h-rnd(128),h-rnd(128),0)end
camera(-h,-h)for j=0,3do
c=7a=e+j*.001line(0,0,cos(a)*h,s(a)*h,c)for k=0,h do
p=cos(s(k/160+a/2)+cos(k/220+s(a/8))+s(cos(k/h-a))/5+cos(k/70+a)/5)
if(p>.3)pset(cos(a)*k,s(a)*k,7+p*4-.2)end
end
check_time()
flip()goto _

-- cls()
-- h=64
-- ::_::
-- e=t()/5
-- for i=0,500do
-- pset(h-rnd(128),h-rnd(128),0)
-- end
-- camera(-h,-h)
-- for j=0,3do
-- c=7
-- a=e+j*.001
-- line(0,0,cos(a)*h,sin(a)*h,c)
-- for k=0,h do
-- p=cos(sin(k/160+a/2)+cos(k/220+sin(a/8))+sin(a*cos(k/h-a))/5+cos(k/70+a)/5)
-- if(p>.35)pset(cos(a)*k,sin(a)*k,7+p*4-.2)
-- end
-- end
-- flip()goto _


--#tweetcart #pico8 #pixelart
