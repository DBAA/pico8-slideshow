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

--looks pretty rad if you take out cls()

pal({135,9,8,136,137,142, 5,130},1)::_::cls()camera(-64,-64)for k=1,2do
e=t()/(k*4)for d=6,64,k+6do
for v=e,e+1,.05do
a=v-sin(e*2)/40b=v+sin(e)/30
g=d+5c=1+(v*2+t()*2+d/8)%k*2+(2-k)*6line(sin(a)*d,cos(a)*d,sin(b)*g,cos(b)*g,c)end
end
end
check_time()
flip()goto _
--#tweetcart #pico8 #pixelart

-- pal({7,135,9,8,136,137,142, 5,130,141,2},1)
-- ::_::
-- cls()
-- camera(-64,-64)
-- for k=1,2do
-- e=t()/(k*4)
-- for d=6,64,k+6do
-- for v=e,e+1,.05do
-- a=v-sin(e*2)/40
-- b=v+sin(e)/30
-- d2=d+5
-- c=1+(v*4+t()*2+d/8)%k*2
-- if(k<2)c+=7
-- line(sin(a)*d,cos(a)*d,sin(b)*d2,cos(b)*d2,c)
-- end
-- end
-- end
-- flip()goto _
-- --#tweetcart #pico8 #pixelart


-- pal({7,135,9,8,136,137,142},1)

-- ::_::
-- e=t()/8
-- cls()
-- camera(-64,-64)
-- for k=0,1do
-- for d=6,64,8do
-- for v=e,e+1,.05do

-- a=v-sin(e*2)/40
-- b=v+sin(e)/30
-- d2=d+5
-- line(sin(a)*d,cos(a)*d,sin(b)*d2,cos(b)*d2, 1+(v*4+t()*2+d/8)%8)

-- end

-- end
-- end

-- flip()goto _
-- --#tweetcart #pico8 #pixelart




--[[
    g=128
pal({2,1,3,14,12,11,g},1)
e=0
r=rnd
::_::
cls(7)
e+=1
for y=0,g do
srand(y+e)
pset(r(g),y,1+r(3))
end
for c=20,g,2do
for k=0,1do
srand(c)
x=r(g)
y=c
p=r(3)
line()
a=0.25
for i=r(5),25do
a+=sin(t()/3+r(.7))/300
d=c/40
x+=cos(a)*d
y+=sin(a)*d
line(x+k,y+k,1+p+k*3)
end
end
end
flip()goto _
]]





-- pal({14,12,11,2,1,3,128},1)
-- e=0
-- ::_::
-- cls(7)
-- e+=1
-- for y=0,128 do
-- x=rnd(128)
-- srand(y+e)
-- pset(x,y,4+x%3)
-- end

-- for c=20,150,2do
-- for k=0,1do
-- srand(c)
-- x=rnd(128)
-- y=c
-- p=rnd(3)
-- line()
-- a=0.25
-- for i=rnd(5),25do

-- a+=sin(t()/3+rnd(.7))/300
-- d=c/40
-- x+=cos(a)*d
-- y+=sin(a)*d
-- line(x+k,y+k,1+p+k*3)
-- end
-- end
-- end

-- flip()goto _
-- --#pico8 #pixelart

