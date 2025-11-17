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


v=sin::_::h=cos?'⁶1⁶c'
for c=32,96,32do
for r=32,96,32do
e=min(1,(t()/5)%1.2)for b=0,.9,.25do
a=.125-b+.25+e+(b-.5)*2l=a+.125
for j=0,20,3do
x=c+h(b)*30+j*h(l)y=r+v(b)*30+j*v(l)
for i=0,20-j/2do
pset(x+h(a)*i,y+v(a)*i,7)pset(x+h(a+.25)*i,y+v(a+.25)*i,7)
end
end
end
end
end
check_time()
goto _


-- h=cos
-- v=sin
-- ::_::?'⁶1⁶c'
-- for c=32,96,32do
-- for r=32,96,32do
-- e=min(1,(t()/4)%1.2)
-- for b=0,.9,.25do
-- a=.125-b+.25+e+(b-.5)*2
-- l=a+.125
-- for j=0,20,3do
-- x=c+h(b)*30+h(l)*j
-- y=r+v(b)*30+v(l)*j
-- for i=0,20-j/2do
-- pset(x+h(a)*i,y+v(a)*i,7)
-- pset(x+h(a+.25)*i,y+v(a+.25)*i,7)
-- end
-- end
-- end
-- end
-- end
-- goto _



-- ::_::
-- cls()

-- for c=32,96,32do
-- r_start = 32
-- if(c==64)r_start+=16
-- for r=r_start,r_start+64,32do
-- e= (t()/4) % 1.2
-- if(e>1) e = 1
-- corner_dist = 30
-- for boxes=0,1,.25do
-- a = 0.125 - boxes+.25 + e
-- if(boxes==0.25 or boxes==0.75)a+=0.5
-- center_a = a + 0.125
-- for j=0,20,4do
-- cx= c + cos(boxes)*corner_dist  + cos(center_a) * j
-- cy= r + sin(boxes)*corner_dist + sin(center_a) * j
-- for i=0,20-j/2 do
-- pset(cx+cos(a)*i, cy+sin(a)*i, 7)
-- pset(cx+cos(a+.25)*i, cy+sin(a+.25)*i, 7)
-- end
-- end
-- end
-- end
-- end

-- flip()
-- goto _



-- ::_::
-- cls()
-- a = 0.125 + t() / 8
-- for y=0,128,3do
-- cx=64
-- cy=y
-- for i=0,100do
-- pset(cx+cos(a)*i, cy+sin(a)*i, 7)
-- pset(cx+cos(a+.25)*i, cy+sin(a+.25)*i, 7)
-- end
-- end

-- flip()
-- goto _
