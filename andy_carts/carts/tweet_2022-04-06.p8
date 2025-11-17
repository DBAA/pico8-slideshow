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


cls()
?"#tweetcart vol.5"
memcpy(0,24576,999)::_::cls()
for x=0,128do
for r=0,6do
l=4+x/10+sin(x/21+t())
y=38+r*l-x/10-sin(x/19+t())*3
if(sget((x/4+t()*12)%72,r)>0)line(x,y,x,y+l,8)
if(pget(x,y-1)!=8 and pget(x,y)==8)line(x,y,x+l,y-l,141)
end
end
check_time()
flip()goto _
--#pico8 #pixelart


-- cls()
-- ?"#tweetcart"
-- memcpy(0,24576,999)::_::cls()
-- for x=0,128do
-- c=(x/4+t()*10)%50
-- for r=0,6,1do
-- l=4+x/10+sin(x/21+t())
-- y=45+r*l-x/10-sin(x/19+t())*3
-- if(sget(c,r) > 0)line(x,y,x,y+l,8)
-- if(pget(x,y-1)!=8 and pget(x,y)==8)line(x,y,x+l,y-l,10)
-- end
-- end
-- flip()goto _
-- --#pico8 #pixelart


-- x=rnd(128)
-- y=rnd(128)
-- mod_x = (x/2 - 2 + t() * 10) % 50 --%188 - 60
-- mod_y = y/(3+x/20) - 5
-- l=2+x/20
-- pset(x,y,0)
-- if(sget(mod_x,mod_y) > 0) pset(x,y,8)
-- if(pget(x,y)<1 and pget(x,y+1)==8) line(x,y,x+l,y-l,9)
-- if(pget(x,y)<1 and pget(x-1,y)==8) line(x,y,x+l,y-l,10)


-- cls()

-- for x=0,128do
-- y=128
-- while y>0do
-- mod_x = (x/2 - 2 + t() * 10) % 50 --%188 - 60
-- mod_y = y/(3+x/20) - 5
-- l=2+x/20
-- if(sget(mod_x,mod_y) > 0) pset(x,y,8)
-- -- if(pget(x,y)<1 and pget(x,y+1)==8) line(x,y,x+l,y-l,9)
-- -- if(pget(x,y)<1 and pget(x-1,y)==8) line(x,y,x+l,y-l,10)
-- y-=1
-- end
-- end

-- for x=0,128do
-- for y=128,0,-1do
-- mod_x = (x/2 - 2 + t() * 10) % 50 --%188 - 60
-- mod_y = y/(3+x/20) - 5
-- l=2+x/20
-- if(sget(mod_x,mod_y) > 0) pset(x,y,8)
-- if(pget(x,y)<1 and pget(x,y+1)==8) line(x,y,x+l,y-l,9)
-- if(pget(x,y)<1 and pget(x-1,y)==8) line(x,y,x+l,y-l,10)
-- end
-- end


-- flip()
-- goto _






