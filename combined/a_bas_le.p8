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


cls()print(" a bas le \n\npatriarcat")memcpy(0,24576,2048)pal({-14,2,-8,8,14,7},1)::♥::u=t()/2cls()for i=0,2880 do
x=i%40y=i\40%18j=-3+i\720n=x/32-u+y/96if sget(x,y)>0 then
c=5.5+j-2*sin(n-x/96)circfill(x*3+7+4*cos(n+3*u),y*3+42+8*sin(n),-sin(n-x/96)-j*2,c)end
end
flip()
check_time()
goto ♥

