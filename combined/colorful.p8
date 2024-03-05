pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/GunTurtle/status/1525246839917887490

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

cls()q={}w={}
for i=1,8 do
add(q,rnd(1))
add(w,rnd(1))
end
pal({128,130,1,2,141,13,142,14,8,136,143,15,7,15,14},1)
t=128
::_::
t+=0.001
for i=1,1024 do
x=128/700*i
y=rnd(128)
c=0
for j=1,#q do
c+=cos(x*q[j]/128+t+cos(y*w[j]/256+t))
end
?"\20",x,y,c*3
end
check_time()
flip()
goto _