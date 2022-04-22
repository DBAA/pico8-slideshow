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

p=14790.5
o=~p+.5
f=fillp
r=rectfill
t=0
::_::
t+=1
cls(7)for i=0,3 do
j=(i*36+t/2)%136-8
f(p)r(j,0,j+8,128,15)f(o)
l=(i*36+t/4)%136-8
r(0,l,128,l+8,15)end
for i=0,1 do
j=(i*50+t)%144-16
f(p)r(j,0,j+16,128,5)f(o)l=(i*72+t/2)%144-16
r(0,l,128,l+16,5)end
check_time()
flip()goto _
