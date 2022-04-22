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

--https://twitter.com/von_rostock/status/1452416180136853523

pal({0,-15,1,-13,-4,12},1)::_::cls(3)srand()c=128d=0
for n=0,90do
if(c>127)c=-rnd(32)d+=10
l=9+rnd(23)p=sin(t()/4+l/99)^2+cos(t()/l*8)^2x,y=c,d
for j=0,l do
a=0v=0u=1
if(j>l*p)a=(j-l*p)/64v=(j+1)%2*sin(a)u=j%2*cos(a)
line(x,y,x+8,y-8,a*13+2)
x+=u
y+=v
end
c+=l+2end
check_time()
flip()goto _