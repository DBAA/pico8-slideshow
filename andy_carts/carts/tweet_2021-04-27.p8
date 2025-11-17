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

pal({9,14},1)
::☀️::
cls(1)
c=t()/3
for d=5,1,-1 do
for l=0,4 do
z=3+l*5
for i=0,z do
a=c+i/z
if(l%2<1)a*=-1;
r=l*20
s=d^1.2*(1.3+sin(c*2+i/z))+l*2
circfill(64+cos(a)*r,64+sin(a)*r,s,1+(d+l)%2)
end
end
end
check_time()
flip()goto ☀️



-- pal({7,140},1)
-- pal({9,14},1)
-- cls()
-- t=0
-- a={}
-- for i=1,40 do
--   a[i]={
--     x=rnd(128),
--     y=rnd(128),
--     a=rnd(),
--     s=rnd()
--   }
-- end
-- ::_::
-- t+=.01
-- for d=5,1,-1 do
--   for i=1,40 do
--     o=a[i]
    
--     s=2+(d^1.5)*2 + sin(o.s+t)*5
--     circfill(o.x,o.y,s,1+(d+i)%2)
    

--     o.a += .05-rnd()*.1
--     o.x += cos(o.a)/6
--     o.y += sin(o.a)/6

--     if(abs(64-o.x)>64 or abs(64-o.y)>64)o.a += .5
--   end
-- end

-- flip()goto _


