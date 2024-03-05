pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/voxeledphoton/status/1208110560040095744
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

--#tweetcart #pico8
h,m,c=158,64,circfill
::_::cls(12)srand(2)c(m,m,12,10)
for i=1,h do
d,r=(i*8+t()*i+rnd(m))%h-12,2+rnd(i/5)
e=cos((d-24)/h)*2/(1+i/m)
for k=0,8 do
fillp(7*i*(h-k)^3+.5)
c(d-e*k*k/3,m+i+k*k/2,r*k/3,1)
end
fillp()
c(d+e,m+i-1,r,7)c(d,m+i,r,6)
end
check_time()
flip()goto _

