pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- noodles
--#tweetcart
--https://twitter.com/andy_makes/status/1372033044740251649
-- 2021-03-16

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


pal({12,7,8,9,10,4})
t=0
::_::
t+=.01
camera(-64,-64)
cls(0)
for i=0,6 do
d=20+i*5
a=i*.1+t
for p=0,3,.01 do
k=a+.5+i*.02
x=(1-p)*sin(k)+p*sin(a)
y=(1-p)*cos(k)+p*cos(a)
x+=sin(p*.5+t)
y+=cos(p*.5+t*.8)
circ(x*d,y*d,2,i)
end
end
check_time()
flip()goto _