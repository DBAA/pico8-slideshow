pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/lexaloffle/status/1582018034264571904

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


t=0pal(15,7,1)c,s,p,f=cos,sin,0,circfill
::_::p+=1poke(24414,17<<p%4)f(0,0,999,0)t+=.01
z=c(t/7)+max(5-t*3)for y=-24,24do
r=(625-y*y)^.5*.7for x=-r,r do
u,v=x*8+(y&1)*4,y*5.5u/=z v/=z a=t/8u,v=c(t/7)*u-s(a)*v,c(a)*v+s(a)*u
f(u+64,v+64,(s(x/6-t)+s(y/5+t))/z,15)end end
check_time()
flip()goto _
