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

printh("start")
a = {"one", "two", "three"}
for i, v in pairs(a) do
  printh(i..v)
end

--wobble prism
pal({136,11,3,137,3,11},1)
::_::
e=t()
for i=1,350 do
e-=.001
s=i/2
a=s/99+(e+i/200)/5
x=64+cos(a)*5
y=64+sin(a)*5
line()
for k=0,3 do
a=e/20+k/3
line(x+cos(a)*s,y+sin(a)*s,1+(i*.05-t()*2)%6)
end
end
check_time()
flip()
goto _
--#tweetcart #pixelart #pico8

-- pal({131,12,131,9,10,14,136,137},1)
-- ::_::
-- e=t()
-- p=e%1
-- step = 5
-- cls()
-- for i=1,110 do
--   s=i+step*p
--   d=20-s/8
--   j=e+i/200
--   x=64+(cos(s/100+j/5)+cos(j/4))*d
--   y=64+sin(s/100+j/5)*d
--   --circ(x,y,s,1+(i+e)%4)
--   circ(x,y,s,(i*.2+t()*2)%6+1)
-- end
-- flip()
-- goto _


-- pal({131,12,131,9,10,14,136,137},1)
-- ::_::
-- --cls()
-- for i=1,110 do
--   s=(t()*20)+i
--   s=s%110
--   d=20-s/8
--   x=64+cos(s/100+t()/5)*d
--   y=64+sin(s/100+t()/5)*d
--   circ(x,y,s,1+(i/4)%8)
-- end

-- flip()
-- goto _

