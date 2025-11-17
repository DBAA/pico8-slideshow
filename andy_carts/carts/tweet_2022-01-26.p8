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


cls()
flip()
::🍩::
x=flr(rnd(128))
y=flr(rnd(128))
d=20
a=t()/5
c=64+sin(a)*d
r=64+cos(a)*d
s=sqrt((x-c)^2+(y-r)^2)
p=0
if(s<40)p=(y+x)%3 
if(s<20)p=1
if(y>64+sin(a/2)*50)p=1-p
pset(x,y,p*7)
check_time()
goto 🍩
--#tweetcart #pico8 #pixelart


-- x=flr(rnd(128))
-- y=flr(rnd(128))
-- p=rnd(3)
-- o=(x+y)%2
-- a=t()/(o+2)+o/2
-- d=30+sin(a/2)*10
-- c=64+sin(a)*d
-- r=64+cos(a)*d
-- s=sqrt((x-c)^2+(y-r)^2)
-- if(s<30)p=3+s/6+o*5
-- pset(x,y,p)




