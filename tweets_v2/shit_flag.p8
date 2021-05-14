pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--shit flag by @2darray

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


cls(6)m=8192
?"shit",3,3,1
memcpy(0,m*3,m)::_::cls()w=-t()/2line(37,54,37,127,5)for x=0,60 do
a=x/45
for y=0,30 do
c=sget(x/3,y/3)+(x+y)%2+.2p=(sin(x/20+w)+a*cos(y/16+w))q=(cos(x/23+w)+sin(y/19+w))*a
u=x+p
v=y+a*7+q
circ(u+39,v+54,1,c+p/3-q/3)end
end
check_time()
flip()goto _
