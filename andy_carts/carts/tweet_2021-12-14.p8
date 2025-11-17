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


--panopticon
::_::
cls()
e=t()
camera(-64,-64)
for x=-64,64,4do
for y=-64,64,5do
s="#tweetcart"
d=(sqrt(x*x+y*y))*(.005+sin(e/2)*.001)
i=(.5+sin(e/8+d))*11
i+=(x+y)%32 * sin(e) * 0.1
i=(i+e/4)%11
?sub(s,i,i),x,y,7
end
end
check_time()
flip()goto _
--#pico8 #pixelart






--pal({135,138,139,137,136,8},1)
--pal({135,138,139,140,12,129},1)
-- w=129
-- pal({135,11,138,140,w,1},1)
-- cls()
-- ?"#tweetcart"
-- ?"gallery",6,6
-- ?"   4"
-- memcpy(0,24576,8192)
-- cls()
-- a={}
-- ::_::
-- for x=1,w do
-- if(#a<x)a[x]={y=-50,c=0}
-- y=a[x].y
-- pset(x-1,y,a[x].c+1+sget(x/3-2,y/5-5)/2)
-- a[x].c=(a[x].c+rnd()/w)%3
-- if(rnd()<.03)a[x].y+=1
-- if(a[x].y>w)a[x].y=0
-- end
-- goto _

-- for x=0,128do
-- for y=0,128do
-- mod_x = x/3 - 2
-- mod_y = y/5 - 5
-- if(sget(mod_x,mod_y) > 0) pset(x,y,8)
-- end
-- end

-- pal({135,138,139,137,136,8},1)
-- cls()
-- ?"#tweetcart"
-- ?" gallery"
-- ?"    v4"
-- memcpy(0,24576,8192)
-- cls()
-- a={}
-- ::_::
-- --cls()
-- --sspr(0,0,48,40,2,9,150,150)

-- for x=1,128do
-- if(#a<x)a[x]={y=-50,c=0}
-- y=a[x].y
-- c=a[x].c+1
-- if(sget(x/3-2,y/5-5) > 0)c+=3
-- pset(x,y,c)
-- a[x].c = (a[x].c + rnd()/300)%3
-- if(rnd()<.02)a[x].y+=1
-- end

-- -- for x=0,128do
-- -- for y=0,128do
-- -- mod_x = x/3 - 2
-- -- mod_y = y/5 - 5
-- -- if(sget(mod_x,mod_y) > 0) pset(x,y,8)
-- -- end
-- -- end

-- -- x=rnd(128)
-- -- y=rnd(128)
-- -- c=pget(x,y)
-- -- if(c>0 and t()>2)pset(x-1+rnd(2),y-1+rnd(2),c)
-- goto _