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

--https://twitter.com/MunroHoberman/status/1335584787403333634

pal({-11,-12,4},1)::_::cls(1)u=t()/8+.5r=cos(u)*9+12for z=0,10do
camera(-63,-70+z)for i=0,1,1/8do
for a=0,1/8,.005do
j=r*cos(i+u)k=r*sin(i+u)line(cos(i+a)*30+j,sin(i+a)*30+k,j,k,z>7and 7or z/2%2+2)end
if(z>9)circfill(j+cos(i+1/16)*22,k+sin(i+1/16)*22,3,8)
end
end
check_time()
flip()goto _
