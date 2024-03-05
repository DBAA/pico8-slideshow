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



function _draw()
 cls(8)
 srand(5)
 for y=0,129,8 do
  for x=0,129,8 do
   a=rnd()+t()/25
   u=mid(-4,4,cos(a)*120)
   v=mid(-4,4,sin(a)*120)
   for i=0,3 do
    line(x+u,y+v-i,x-u,y-v-i,i>2 and 7 or 2)
   end
  end
 end
 check_time()
end