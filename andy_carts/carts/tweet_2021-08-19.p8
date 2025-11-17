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

::_::cls(14)w=64
for k=9,w,3do
line(5)
d=(t()+k/40)%6
if(k%2>0)d=6-d
c=0
for i=0,7do
if d<i then
p=d%1
x=w+cos(i/6)*k
y=w+sin(i/6)*k
a=w+cos((i-1)/6)*k
b=w+sin((i-1)/6)*k
d+=1
line(x*p+a*(1-p),y*p+b*(1-p))
if(c>0)break;
c=1
line(x,y)
end
end
end
check_time()
flip()goto _
--#tweetcart #pico8


-- ::_::
-- cls(14)
-- s=6
-- for k=9,60,3 do
--   line(5)
--   d=(t()+k/40)%s
--   if(k%2>0)d=s-d
--   c=0
--   for i=0,9 do
--     if d<i then
--       p=d%1
--       x=64+cos(i/s)*k
--       y=64+sin(i/s)*k
--       x2=64+cos((i-1)/s)*k
--       y2=64+sin((i-1)/s)*k
--       d+=1
--       line(x*p+x2*(1-p),y*p+y2*(1-p))
--       if(c>0)break;
--       c=1
--       line(x,y)
--     end
--   end
-- end
-- flip()goto _
