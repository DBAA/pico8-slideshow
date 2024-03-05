pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@munrohoberman  distance signs
--https://twitter.com/munrohoberman/status/1365000731284041732

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

flip()
function s(n)return mid(1,(n-.3)/0)end
pal({-16,-14,-11,-3,13},1)
::_::
r=t()/8
x=rnd(128)
y=rnd(128)
e=x/128-cos(r)/4-.5
f=y/128-sin(r)/4-.5
j=cos(r)*e-sin(r)*f/2+.5
k=sin(r)*e/2+cos(r)*f+.5
n=s(j)m=s(k)n*=s(1-j)m*=s(1-k)
c=abs(pget(x,y)-1)
circ(x,y,1,min(7,n*m*2+c))
check_time()
goto _