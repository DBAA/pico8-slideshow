pico-8 cartridge // http://www.pico-8.com
version 29
__lua__


--by 2darray

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


pal(5,13)::_::cls(1)srand(13)c=300
for j=0,3 do
x=(rnd(256)-t()*(24+rnd(8)))%256-110v=rnd(80)for i=0,1,1/c do
y=rnd(25-abs(i-.5)*40)for k=0,1 do
circfill(x+i*100,120-v-y+k,3,mid(5+y/13-k+rnd(y/2+1),7,5))end
end
end
check_time()
flip()goto _