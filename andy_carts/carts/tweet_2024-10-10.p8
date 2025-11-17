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


pal({7,12,140,13,129,1,5,8,8,14,142,143,7},1)
cls()flip()
r=rnd::_::x=r(128)y=r(128)c=9+y/26-2+r(1.5)
if(y<((x+40)/6)^1.6and y<((178-x)/6)^1.6and y<79+r(2))c=2.5-sgn(y-45-sin(x/21)*r(4))*1.5+r(2.5-sgn(x-69-r(8)-y/3+25)*.7)
pset(x,128-y,c)a=r(1)d=r(25)pset(28+sin(a)*d,30+cos(a)*d,9)
check_time()
goto _


-- pal({7,12,140,13,129,1,5,8,8,14,142,143,7},1)
-- r=rnd
-- ::_::
-- x=r(128)
-- y=r(128)
-- c=9+(y-40)/26+r(1.5)
-- if(y<((x+40)/6)^1.6and y<((178-x)/6)^1.6and y<79+r(2))c=2.5-sgn(y-45-sin(x/21)*r(4))*1.5+r(2.25-sgn(x-69-r(8)-y/3+25)*.75)
-- pset(x,128-y,c)
-- a=rnd(1)
-- d=rnd(20)
-- pset(25+sin(a)*d,25+cos(a)*d,9)
-- goto _






-- pal({7,12,140,13,129,1,5, 8,8,14,142,143,7},1)
-- ::_::
-- x=r(128)
-- y=r(128)

-- col = 9+ (y-40)/26 + r(1.5)

-- --if( y < (x/5)^1.5 and y < ((128-x)/6)^2 ) col += 5
-- div = 6
-- exp = 1.6
-- spacing = 40
-- if y < ((x+spacing)/div)^exp and y < ((128+spacing-x)/div)^exp and y < 79+r(2) then
--     col = 1 + r(2)
--     if (x>60+r(8)) col += r(2)
--     if y < 60+sin(x/21)*r(4) then
--         col += 3
--     end
-- end


-- pset(x,128-y, col)
-- goto _


