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


pal({1,8,3,9,14,4})cls()flip()s=sin::_::x=rnd(128)y=rnd(128)e=t()for c=-2,1do
for r=-1,1do
a=64+c*54+r%2*27b=64+r*48line()for i=0,1,1/6do
line(a+s(i)*30,b+cos(i)*30,7)end
if(sqrt((x-a)^2+(y-b)^2)<15+s(c/7)*4+s(r/2)*4)pset(x,y,2+c+r*2+s(x/81+e)*2+cos(y/(14*c)))end
end
check_time()
goto _--#tweetcart





-- s=sin
-- cls()
-- pal({1,8,3,9,14,4})
-- ::_::
-- x=rnd(128)
-- y=rnd(128)
-- e=t()
-- for c=-2,1do
-- for r=-1,1do
-- a=64+c*54+r%2*27
-- b=64+r*48
-- line()
-- for i=0,1,1/6do
-- line(a+sin(i)*30,b+cos(i)*30,7)
-- end
-- if(sqrt((x-a)^2+(y-b)^2)<15+s(c/7)*4+s(r/2)*4)pset(x,y,2+c+r*2+s(x/81+e)*2+cos(y/(14*c)))
-- end
-- end
-- goto _










-- w=128
-- s=sin
-- cls()
-- pal({1,8,3,9,14,4},1)
-- ::_::
-- x=rnd(w)
-- y=rnd(w)
-- e=t()

-- for c=-2,1do
-- for r=-1,1do

-- cx=64+c*54+abs(r%2)*27
-- cy=64+r*48
-- line()
-- for a=0,1,1/6do
-- line(cx+sin(a)*30, cy+cos(a)*30, 7)
-- end



-- if sqrt((x-cx)^2+(y-cy)^2)<15 then
--     p=2+c+r*2+s(x/81+e)*2+cos(y/(14*c))
--     pset(x,y, p)
-- end

-- end
-- end

-- goto _
-- --#tweetcart #pico8 #pixelart

