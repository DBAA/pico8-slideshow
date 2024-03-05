pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/picoter8/status/1338999751346450437

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



-- spiral coils #pico8 #tweetcart #tweetjam
::_::cls(7)
for r=12,96,2do
for a=0,1,1/r do
b=a+.8*(1-r/48)*t()
x=64+r*cos(b)
y=64+r*sin(b)
ovalfill(x,y,x+3,y+3,0)
end
end
check_time()
flip()goto _