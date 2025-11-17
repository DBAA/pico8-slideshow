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


pal({141,13,8,7},1)
function h(x,y,b,z)
for d=0,m,m/7do
for i=0,.8,.2do
a=b+i+e/5+sin(e/3+d/300)/4
if(d+z<1)h(x+cos(a)*m*2,y+sin(a)*m*2,-a,1)
if(d>1)line(x+cos(a)*d,y+sin(a)*d,2-z+d%3)
end
line()
end
end
::_::cls()e=t()m=30+sin(e/3)*10h(64,64,0,0)
check_time()
flip()goto _
--#tweetcart #pico8

-- pal({7,141,8,13},1)
-- function h(x,y,b,z)
-- for d=0,m,m/7do
-- for i=0,.8,.2do
-- a=b+i+e/5+sin(e/3+d/300 )/4
-- if(d+z<1)h(x+cos(a)*m*2,y+sin(a)*m*2,-a,1)
-- if(d>1)line(x+cos(a)*d,y+sin(a)*d,1+z+d%3)
-- end
-- line()
-- end
-- end
-- ::_::
-- cls()
-- e=t()
-- m=30+sin(e/2)*10
-- h(64,64,0,0)
-- flip()goto _
-- --#tweetcart #pico8



--this whole thing is boring
-- cls()
-- pal({9,10,7,142,137,8,12},1)
-- pal({7,12,142,138,8,11},1)
-- pal({143,7,12,142,10},1)
-- --pal({12,8,7},1)
-- pset(64,64,7)
-- -- v=1
-- kx=0
-- ky=0
-- ::_::

-- x=rnd(128)
-- y=rnd(128)
-- c=pget(x,y)
-- if c>0 then
-- x2=x+1-rnd(2)
-- y2=y+1-rnd(2)
-- old = pget(x2,y2)

-- --if(y2%2<1 or x2%3<1 and c>pget(x2,y2))pset(x2,y2,c)
-- --if(c>old or c==1 and old==3)pset(x2,y2,c)

-- if y2%2<1 or x2%3<1 then
--     new_c = 1 + (x2/9+ y2^1.3/60)%5
--     if(new_c!=old)pset(x2,y2, new_c)
--     --pset(x2,y2, (x2+y2)/20)
-- end

-- -- if y2%2<1 or x2%3<1 then
-- -- if (old < 1)            pset(x2,y2,c)
-- -- if (old==1 and c==2)    pset(x2,y2,c)
-- -- if (old==2 and c==3)    pset(x2,y2,c)
-- -- if (old==3 and c==1)    pset(x2,y2,c)
-- -- end

-- -- pset(kx,ky,0)
-- -- ky+=0.1
-- -- if(ky>128)kx,ky=(kx+3)%129,0

-- printh(kx%129)
-- pset(3*flr(t()*9)%129,ky%128,0)
-- ky+=1
-- end

-- --pset(64,64, 1+(t()/3)%3)
-- -- if(rnd(999)<.01)v+=1
-- -- pset(64,64,v)

-- goto _
-- --#pico8 #tweetcart