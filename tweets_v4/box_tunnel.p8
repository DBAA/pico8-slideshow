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


c={0,1,2,8,14,15,7}
fillp(0xa5a5)
function _draw()
 for w=3,68,.1 do
  a=4/w+t()/4
  k=145/w
  x=64+cos(a)*k
  y=64+sin(a)*k
  i=35/w+2+t()*3
  rect(x-w,y-w,x+w,y+w,f(i)*16+f(i+.5))
 end
 check_time()
end
function f(i)
 return c[flr(1.5+abs(6-i%12))]
end