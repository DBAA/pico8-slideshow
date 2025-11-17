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


t=0
::꩜::
t+=1/30
cls(9)
camera(-64,-64)
for k=0,9do
for i=0,1,.02do
a=k+t%2
s=mid(4,6,(5+sin((a+t)/8)*3))
d=a*(5+a)+sin(a+i*s+t)*(2+a)
x=cos(i)*d
y=sin(i)*d
circfill(x,y,2+d/5,8+k%2)
end
end
check_time()
flip()
goto ꩜


-- t=0
-- ::_::
-- t+=.03
-- cls()
-- camera(-64,-64)
-- for k=0,128,11do
-- for i=0,1,.02do
-- d=k+sin(i*8+t)*5
-- x=cos(i)*d
-- y=sin(i)*d
-- circfill(x,y,2+k/6,8+k%2)
-- end
-- end

-- flip()
-- goto _


