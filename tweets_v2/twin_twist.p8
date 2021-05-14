pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--twin twist by @gateeightyeight
--https://twitter.com/gateeightyeight/status/1225934081566879745

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


pal(2,13,1)pal(3,7,1)
camera(-64,-64)::_::cls()
for i=.05,1,.05 do
j=t()*i/5%1
k=t()*(i-0.5)/5%1
x,y,z=sin(j),cos(j),sin(t()/5)
a,b,c,d=x*60,x*y*80,y*60*z,x*60*z
e=i*3+1
line(a,b,c,d,e)
if not(i==0.05) then
line(a,b,l,m,e)
line(c,d,n,o,e)
end
l,m,n,o=a,b,c,d
end
check_time()
flip()goto _

