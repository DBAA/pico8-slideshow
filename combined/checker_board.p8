pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/p01/status/1618273122502987778

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

::_::⧗=t()/7c=8*cos(⧗)s=8*sin(⧗)for j=0,1do
for u=-3.5,4do
for v=-3.5,4do
x=64+(u*c-v*s)y=64+(v*c+u*s)/2line((u+v)%2+5)
for i=j*32+█,32do
line(x+cos(i/4+⧗)*i/4,y+sin(i/4+⧗)*i/8)end
if(v*v>6/j)?"●\n❎",x-3,y-10,4+3.5*sgn(v)
end
end
end?"\^1\^cd"
check_time()
goto _