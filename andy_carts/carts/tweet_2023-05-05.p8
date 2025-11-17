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


pal({1,8,10,2,9})
::_::
for i=0,3999do
pset(rnd(128),rnd(128),flr(mid(0,1,rnd(9)-7)))
end
e=t()/6
o=e%1
m=mid(0,sin(e*2),1)
for d=1+o,o-1,-.2do
for z=0,1do
for k=0,6do
i=flr((t()-k+1-d)%6)
by=128*d 
g=sin(d*2+e)
a=-e+i/6+by/999+sin(d)/15
x=64+cos(a)*(45+g*5+m*9)
ym=sin(a)
y=by-ym*10
c=i%2
if(k>0and z==0)line(x,y,px,py,3+c)
if z==1then
s=7+g-ym
circ(x,y,s,2+c)
circfill(x,y,s-1,4+c)
end
px=x
py=y
r=5+m*10
x=64-r/2+rnd(r)
if(k==3)line(x,y-13,x,y+13,7)
end
end
end
check_time()
flip()
goto _
--#tootcart #pico8


-- pal({8,10,2,9,1})
-- ::_::
-- for i=0,3999do
-- pset(rnd(128),rnd(128),5*flr(mid(0,1,rnd(9)-7)))
-- end
-- e=t()/6
-- o=e%1
-- m=mid(0,sin(e*2),1)
-- for d=1+o,o-1,-.2do
-- for z=0,1do
-- for k=0,6do
-- i=flr((t()-k+1-d)%6)
-- by=128*d 
-- g=sin(d*2+e)
-- a=-e+i/6+by/999+sin(d)/15
-- x=64+cos(a)*(45+g*5+m*9)
-- ym=sin(a)
-- y=by-ym*10
-- c=i%2
-- if(k>0 and z==0)line(x,y,px,py,3+c)
-- if z==1 then
-- s=7+g-ym
-- circ(x,y,s,1+c)
-- circfill(x,y,s-1,3+c)
-- end
-- px=x
-- py=y
-- lr= 5+m*10
-- lx=64-lr/2+rnd(lr)
-- if(k==3)line(lx,y-13,lx,y+13,7)
-- end
-- end
-- end
-- flip()
-- goto _
-- --#tootcart #pico8




-- pal({8,10,2,9})
-- ::_::
-- for i=0,3999do
-- pset(rnd(128),rnd(128),0)
-- end
-- e=t()/6
-- o=e%1
-- for d=1+o,o-1,-.2do
-- for z=0,1do
-- for k=0,6do
-- i=flr((t()-k+.5)%6)
-- by=128*d 
-- a=-e+i/6+by/999
-- x=64+cos(a)*50
-- y=by-sin(a)*10
-- c=i%2
-- if(k>0 and z==0)line(x,y,px,py,3+c)
-- if z==1 then
-- circ(x,y,7,1+c)
-- circfill(x,y,6,3+c)
-- end
-- px=x
-- py=y
-- end
-- end
-- end
-- flip()
-- goto _--#tweetcart





-- pal({12,10,8,11,7,1,9,2,3,5},1)

-- ::_::
-- --cls()
-- for i=0,3999do
-- pset(rnd(128),rnd(128),0)
-- end

-- e=t()/5

-- o=e%1
-- for d=1+o,o-1,-.2do
-- for z=0,1do
-- for k=0,5do
-- i = flr((t()-k+.5)%5)


-- by = 128 * d 
-- a=-e+i/5+by/999

-- x=64+cos(a) * 50
-- y=by-sin(a) * 10

-- --circ(x,y,7, (d-o)*5)
-- if(k>0 and z==0)line(x,y,px,py, 6+i%2)

-- if z==1 then
--     circ(x,y,7, 1+i%2)
--     circfill(x,y,6, 6+i%2)
-- end

-- -- 
-- -- if(k>0)line(x,y,px,py, 6+i)
-- --circfill(x,y,6, 6+i)
-- px=x
-- py=y
-- --print(k, x,y, 0)
-- end
-- end
-- end

-- flip()
-- goto _--#tweetcart

