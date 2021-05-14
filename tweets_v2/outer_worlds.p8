pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/trasevol_dog/status/781921460705234944  
--@trasevol_dog outer worlds

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

flip()
r=rnd::s::t=time()if t%0.5<0.01then
for i=0,99 do
pset(r(4),r(8),flr(r(2)))end
memcpy(0,24576,512)end
x,y=r(128),r(128)
c=sget(abs((x-64)/16),y/16)
c*=((abs(x-64)+abs(y-64)-t*20)/20%8+8)
circ(x,y,1,c)
check_time()
goto s