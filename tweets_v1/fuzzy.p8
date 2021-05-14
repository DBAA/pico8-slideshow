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

f=1m=-15l=-m::_::t=time()cls()i=t/24pal(2,129,1)d=circfill
if(t%6==0)l,m,f=m,-l,-f
for p=-l,l,sgn(l)do
for q=-m,m,sgn(m)do
s=sin(i)c=cos(i)x,y=p,q
if(f==1)x,y=y,x
h=70+(s*x+c*y)-sin(t/3+(x+y)/30)*10d(64+(c*x-s*y)*5,h,2,y%2+1)
if(x==0 and y==0)d(63,h-5,2,8)end
end
check_time()
flip()goto _

