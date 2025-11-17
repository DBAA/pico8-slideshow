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


--trying to fit everything in one (but i can't yet)
e=line
cls(0)s=0for r=0,30do
l=0for c=0,30do
if rnd()<s or c>29then
y=r*4x=l*4w=c*4+4rect(x,y,w,y+4,7)e(x+2,y+2,w-2,y+2)x=flr(l+rnd(c-l))*4e(x+1,y,x+3,y,0)e(x+2,y-2,x+2,y+2,7)l=c+1if(r<1)a,b=x,y+1end
end
s=.5end::_::
l+=1v,h=l%2*2-1,0if(l%4>1)v,h=h,v
if(pget(a+h,b+v)<1)a,b=a+h,b+v
pset(a,b,9)
check_time()
flip()goto _

-- cls(0)
-- s=0
-- e=line
-- for r=0,30do
--   l=0
--   for c=0,30do
--     if rnd()<s or c>29then
--       y=r*4
--       x=l*4
--       w=c*4+4
--       rect(x,y,w,y+4,7)
--       e(x+2,y+2,w-2,y+2)
--       x=flr(l+rnd(c-l))*4
--       e(x+1,y,x+3,y,0)
--       e(x+2,y-2,x+2,y+2,7)
--       l=c+1
--       if(r<1)a,b=x,y+1
--     end
--   end
--   s=.5
-- end
-- ::_::
-- l+=1
-- v,h=l%2*2-1,0
-- if(l%4>1)v,h=h,v
-- if(pget(a+h,b+v)<1)a,b=a+h,b+v
-- pset(a,b,9)
-- flip()
-- goto _


--tweet version
-- v=line::_::cls(0)s=0for r=0,30 do
-- l=0for c=0,30 do
-- if s>rnd()or c>29then
-- y=r*4+1x=l*4+1b=(c+1)*4+1rect(x,y,b,y+4,7)v(x+2,y+2,b-2,y+2,7)n=flr(l+rnd(c-l))x=n*4+1v(x+1,y,x+3,y,0)v(x+2,y-2,x+2,y+2,7)l=c+1flip()end
-- end
-- s=.5end
-- for i=0,60do
-- flip()end
-- goto _--#tweetcart #pico8 #pixelart


--with solver
-- cls(0)
-- s=0
-- for r=0,30 do
--   l=0
--   for c=0,30 do
--     if rnd()<s or c>29 then
--       y=r*4+1
--       x=l*4+1
--       b=(c+1)*4+1
--       rect(x,y,b,y+4, 7)
--       line(x+2,y+2,b-2,y+2,7)
--       n=flr(l+rnd(c-l))
--       x=n*4+1
--       line(x+1,y,x+3,y,0)
--       line(x+2,y-2,x+2,y+2,7)
--       l=c+1
--       if r<1 then
--         pset(x+1,y,11)
--         px=x+1
--         py=y
--       end
--     end
--   end
--   s=.5
-- end
-- ::_::
-- for i=0,20 do
-- if pget(px,py+1)==0 then
--   pset(px,py+1,11)
--   py+=1
-- end
-- if pget(px-1,py)==0 then
--   pset(px-1,py,11)
--   px-=1
-- end
-- if pget(px,py-1)==0 then
--   pset(px,py-1,11)
--   py-=1
-- end
-- if pget(px+1,py)==0 then
--   pset(px+1,py,11)
--   px+=1
-- end
-- end
-- flip()
-- goto _





