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


p=pset::_::cls()for i=0,99do
u=0s=i/4+t()/5x=64+sin(s)*39a=64+sin(s+.25)*39y=39+cos(s)*9b=39+cos(s+.25)*9line(x,y,a,b,6)for k=0,99do
if x>a and i<4and k<50then
line(x,y+k,a,b+k,k>48and 7or 9+i)p(x,y+k,7)p(a,b+k)end
v=pget(i,k)u+=v
if(v>6)break
if(u>0)p(i,k,8)end
end
check_time()
flip()goto _



-- p=pset
-- ::_::
-- cls()
-- for i=0,99do
-- u=0
-- s=i/4+t()/5
-- x=64+sin(s)*39
-- a=64+sin(s+.25)*39
-- y=39+cos(s)*9
-- b=39+cos(s+.25)*9
-- line(x,y,a,b,6)
-- for k=0,99do
-- if x>a and i<4and k<50then
-- line(x,y+k,a,b+k,k>48and 7or 9+i)
-- p(x,y+k,7)
-- p(a,b+k)
-- end
-- v=pget(i,k)
-- u+=v
-- if(v>6)break
-- if(u>0)p(i,k,8)
-- end
-- end
-- flip()goto _

--302


-- g=.25
-- ::_::
-- cls()
-- for i=0,99 do
-- s=i/4+t()/5
-- x=64+sin(s)*39
-- y=64+sin(s+g)*39
-- a=39+cos(s)*9
-- b=39+cos(s+g)*9
-- if x>y and i<4 then
-- for h=0,50do
-- line(x,a+h,y,b+h,9+i)
-- end
-- end
-- line(x,a,y,b,1)

-- p=0
-- for y=0,99do
-- p+=pget(i,y)
-- if(pget(i,y)>1)break
-- if(p>0)pset(i,y,8)
-- end
-- end
-- flip()goto _


-- g=.25
-- ::_::
-- cls()
-- for i=0,99 do
-- s=i/4+t()/5
-- x=64+sin(s)*39
-- y=64+sin(s+g)*39
-- a=39+cos(s)*9
-- b=39+cos(s+g)*9
-- if x>y and i<4 then
-- for k=0,50do
-- line(x,a+k,y,b+k,9+i)
-- end
-- end
-- line(x,a,y,b,1)

-- k=0
-- for y=0,99do
-- k+=pget(i,y)
-- if(pget(i,y)>1)break
-- if(k>0)pset(i,y,8)
-- end
-- end
-- flip()goto _

-- for i=0,1,g do
-- s=i+t()/5
-- x=64+sin(s)*39
-- y=64+sin(s+g)*39
-- a=39+cos(s)*9
-- b=39+cos(s+g)*9
-- if x>y then
-- for k=0,50do
-- line(x,a+k,y,b+k,9+i*4)
-- end
-- end
-- line(x,a,y,b,1)
-- end
-- for x=0,99do
-- k=0for y=0,99do
-- k+=pget(x,y)
-- if(pget(x,y)>1)break
-- if(k>0)pset(x,y,8)end
-- end
-- flip()goto _


----------------------
-- 1st version you posted
----------------------

-- g=.25::_::cls()for i=0,1,g do
-- s=i+t()/5x=64+sin(s)*39y=64+sin(s+g)*39a=39+cos(s)*9b=39+cos(s+g)*9if x>y then
-- for k=0,50do
-- line(x,a+k,y,b+k,9+i*4)end
-- end
-- line(x,a,y,b,1)end
-- for x=0,99do
-- k=0for y=0,99do
-- k+=pget(x,y)if(pget(x,y)>1)break
-- if(k>0)pset(x,y,8)end
-- end
-- flip()goto _


