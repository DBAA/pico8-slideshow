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


e,t=0,0
::_::
if(t%3<.1)e,f=t,e
p=mid(0,1,t%3)
t+=.1
cls()
for i=0,128,5do
srand(f+i)
a=flr(rnd(2))*5
srand(e+i)
b=flr(rnd(2))*5
o=(1-p)*a+p*b
for j=-o,128,10do
line(i,j,i,j+5,14)
line(j,i,j+5,i)
end
end
check_time()
flip()
goto _
--#tweetcart #pico8 #pixelart #Hitomezashi

-- e,t=0,0
-- ::_::
-- if(t%2<.1)e,f=rnd(99),e
-- p=mid(0,1,t%2)
-- t+=.1
-- cls()
-- for i=0,128,8do
-- srand(f+i)
-- a=flr(rnd(2))*8
-- srand(e+i)
-- b=flr(rnd(2))*8
-- o=(1-p)*a+p*b
-- for j=-o,128,16do
-- line(i,j,i,j+8)
-- line(j,i,j+8,i)
-- end
-- end
-- flip()
-- goto _
-- -- --#tweetcart #pico8 #pixelart

-- t=0
-- ::_::
-- t+=.2
-- cls()
-- y=t%8

-- for i=0,128,8do
-- srand(99 + 6+i - flr(t/8))
-- o=flr(rnd(2))*8
-- for j=-o,128,16do
-- line(i,j-y,i,j-y+8)
-- line(j,i-y,j+8,i-y)
-- end
-- end
-- flip()
-- goto _
-- -- --#tweetcart #pico8 #pixelart

