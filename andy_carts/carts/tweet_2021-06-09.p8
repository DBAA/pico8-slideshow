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


v=130pal({-4,12,14,-9,-7,v},1)f=sin::_::cls()e=t()/9for i=e*90%9,256,9do
line(0,i,v,i-v,6)end
for j=1,9do
for s=0,6do
d=j*9o=f(e+j/20)/3a=o+s/6x=cos(a)*d+64y=f(a)*d+64for k=0,17do
r=1+(5+f(e)*4+k/4)%6p=r%1g=1-p
if(r-p==s)circ(x*p+c*g,y*p+z*g,2,k/3)end
c=x
z=y
end
end
check_time()
flip()goto _



-- pal({140,12,14,135,137,9,130},1)
-- ::_::
-- cls()
-- e=t()/9
-- for i=(e*90)%9,256,9 do
-- line(0,i,128,i-128,7)
-- end
-- for j=1,9do
-- for s=0,6do
-- d=j*9
-- o=sin(e+j/20)/3
-- a=s/6+o
-- x=64+cos(a)*d
-- y=64+sin(a)*d
-- for k=0,16do
-- r=1+(5+sin(e)*4+k/4)%6
-- p=r%1
-- g=1-p
-- if(r-p==s)circ(x*p+c*g,y*p+z*g,2,1+k/3)
-- end
-- c=x
-- z=y
-- end
-- end
-- flip()goto _


-- ::_::
-- cls()
-- e = t()/10
-- for d=1,9 do
-- line()
-- for s=0,7 do
--   dist = d * 10
--   a_off = sin(e + d/20)/3
--   a = s/7 + a_off
--   x=64+cos(a)*dist
--   y=64+sin(a)*dist
--   line(x, y, 7)

--   prc = .5 + sin(e*2)/2
--   if s>0 then
--     --a = 
--     --printh(a)
--     circ(x*prc + px*(1-prc),y*prc+py*(1-prc), 2, 9)
--     --pset(a,y*prc+py*(1-prc),9)
--   end

--   px = x
--   py = y
-- end
-- end


-- flip()
-- goto _
--#tweetcart #pixelart #pico8 #loop
