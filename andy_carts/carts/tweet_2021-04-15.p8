pico-8 cartridge // http://www.pico-8.com
version 16
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


t=0pal({1,131,135,10,9,137},1)r=rnd::_::cls()t+=1camera(-64,-64)for z=5,99 do
srand(z-t)if r(2)<1then
d=z*.8s=flr(r(9))/9+t/300c=1+flr(r(3))*2+s%1*2for p=0,1,1/z do
a=s-p*.1line(cos(a)*d,sin(a)*d,cos(a)*z,sin(a)*z,c)end
end
if(r(9)<1)circ(0,0,z*1.3)end
check_time()
flip()goto _--#tweetcart 

-- pal({14,7,11,7},1)
-- ::_::
-- cls()
-- --camera(-64,-64)
-- for d=0,4 do
-- for y=0,128,10 do
-- for x=0,128,10 do
-- o=1
-- --if(d>1)o=.75 
-- k = 0
-- if ( ( (y+x)/10)%2==0)k=.5
-- dist= abs(64-x)+abs(64-y)
-- a=mid(-.25,sin(k+t()*o*.2+(dist)*.003),0.5)
-- line(x+d,y+d,x+d+sin(a)*10,y+d+cos(a)*10, d+1)
-- end
-- end
-- end
-- flip()goto _
-- --#tweetcart 

-- 
-- --t=0
-- ::_::
-- --t=time()
-- f=20
-- o=f*(t()%1)
-- cls(1)
-- for d=5,1,-1 do
-- for c=-1,8 do
-- for r=-1,8 do
--   x=c*f
--   y=r*f
--   s=((d/5)^1.3)*(23+sin((x+y+o*2)*.005+t())*7)
--   rectfill(x-s/2+o,y-s/2+o,x+s/2+o,y+s/2+o,d+((c+r)%2)*5)
-- end
-- end
-- end
-- flip()goto _
-- --#tweetcart
