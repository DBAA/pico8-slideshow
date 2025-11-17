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

pal({5,1,12,4,137,9,141,2})
cls()flip()
t=0::_::?'⁶1⁶c'
t+=.1
for r=0,10do
for c=8,-1,-1do
srand(c+r*16+flr(t))x=r+c*16-t%1*16y=14*r+x/4h=30+sin(rnd()+t/(r+3))*15b=(1+r*3)%9fillp(flr(rnd(999)))rectfill(x,y,x+11,y-h,b+2+0x1c)fillp()
for i=0,6do
x-=1y-=1line(x,y,x,y-h,b)line(x,y-h,x+12,y-h,b+1)
end
end
end
check_time()
goto _


-- pal({5,1,12,4,137,9,141,2})
-- t=0
-- ::_::?'⁶1⁶c'
-- t+=.1
-- p=t%1
-- for r=0,10do
-- for c=8,-1,-1do
-- srand(c+r*16+flr(t))
-- x=c*16-p*16+r
-- y=14*r+x/4
-- h=30+sin(rnd()+t/(r+3))*15
-- b=(1+r*3)%9
-- fillp(flr(rnd(999)))
-- rectfill(x,y,x+11,y-h,b+2+0x1c)
-- fillp()
-- for i=0,6do
-- x-=1
-- y-=1
-- line(x,y,x,y-h,b)
-- line(x,y-h,x+12,y-h,b+1)
-- end
-- end
-- end
-- goto _


-- t=0
-- ::_::
-- t+=.1
-- cls()
-- p=t%1

-- for r=0,14do
-- for c=16,-1,-1do
--     srand(c+r*16+flr(t))

--     x=c*8-p*8 + r
--     y=  10*r + x/4
--     h=20+sin(rnd()+t/(r+5))*10

--     base = (1+r*3)%9

--     rectfill(x,y,x+6,y-h,base+2)
--     for i=0,3do
--         x-=1
--         y-=1
--         line(x,y,x,y-h,base)
--         line(x,y-h,x+7,y-h,base+1)
--     end

-- end
-- end

-- flip()goto _


-- t=0
-- ::_::
-- t+=.1
-- cls()
-- p=t%1

-- for k=0,1do

-- for c=16,0,-1do
--     srand(c+flr(t))

--     x=c*8-p*8
--     y= 99--69+rnd(39)
--     h=20+sin(rnd()+t/9)*10

--     rectfill(x,y,x+6,y-h,12)
--     for i=0,3do
--         x-=1
--         y-=1
--         line(x,y,x,y-h,13)
--         line(x,y-h,x+7,y-h,1)
--     end


-- end
-- end

-- flip()goto _


-- for i=0,3do
--     x+=1
--     y+=1
--     color = 12
--     if(i<1 or i>2)color = 5
--     rect(x,y,x+4,y-h, color)
-- end
-- line(x,y,x-3,y-3)
-- line(x,y-h,x-3,y-h-3)
-- line(x+4,y-h,x,y-h-3)