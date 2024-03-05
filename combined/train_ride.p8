pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/jahndis/status/1229652279222947840

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


z,t,r,c=128,0,rectfill,circfill::_::cls(2)
c(40,64,25,10)
r(0,90,z,z,1)
for i=0,z do
r(i,64-sin(sin((i-t)/999))*20,i,90,3)
r(i,70,i,99-sqrt(abs(sin((i-t*4)/z)*640)),6)
end
for i=0,32 do
r(40+24*i,65,64+24*i-2,69,5)
if(i%8<7)then r(41+3*i,67,42+3*i,67,9)
end
end
t+=1
check_time()
flip()goto _