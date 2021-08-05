pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/munrohoberman/status/1361314323012988938

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

function v(x,y,n,a)j=x+n*cos(a)k=y+n*s(a)line(x,y,j,k,7)x=j
y=k
for i=-1,1do
if(n>2)v(x,y,n/2,a+i/4+max(s(l)))end
end
pal({-16,2,-8,-2,-1,15},1)s=sin::_::l=t()/8for y=0,127,3do
for x=0,127do
z=(y-l*999)%127pset(x,z,abs(pget(x,z)-1))end
end
for i=0,4do
v(63,63,29,i/4+l)end
check_time()
flip()
goto _