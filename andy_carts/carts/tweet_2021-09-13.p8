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

pal({130,8,9,10,135,137,142,136},1)
::🌞::
cls()
e=t()
g=40
for d=8,1,-1do
for k=0,g do
v=k/g+e/g
h=35+sin(e)*6
x=64+cos(v)*h
y=64+sin(v)*h
a=e+d/g+k/10
f=d*3
camera(sin(a)*f,cos(a)*f)
s=d
rectfill(x-s,y-s,x+s,y+s,1+(e*9-d)%8)
--circfill(x,y,s,1+(e*9-d)%8)
end
end
check_time()
flip()goto 🌞
--#tweetcart #pico8 #pixelart


