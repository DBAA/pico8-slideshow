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

--https://twitter.com/ValerADHD/status/1331855381862223875

cls()
flip()
w=128r=rnd
for i=0,99do
?1,r(w),r(w),i|8
end
for i=0,999do
?chr(-r(2)),i%22*6,i\22*4,7
end::_::x=r(w)\1*6y=r(w)\1*4
?"◆",x,y,0
?chr(-r(2)),x,y,7
for i=0,99do
x=r(w)y=r(w)k=pget(x,y)if k>7then
for d=0,1,.25do
a=x+cos(d)b=y+sin(d)
if(pget(a,b)!=7)pset(a,b,k)end
end
end
check_time()
--flip()
goto _

