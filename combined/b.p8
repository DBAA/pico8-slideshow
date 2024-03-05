pico-8 cartridge // http://www.pico-8.com
version 16
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

--https://twitter.com/p01/status/1243498818269831168
c=circfill
d=cos::_::s=t()for i=1,99 do
if(i<6)pal(i,-({16,14,11,3,10})[i],1)c(64,64,(6-i+s%2)^3,i%2)
m=i/198*d(i/2)q=64/(4+d(m))j=2+i/19
fillp(({1034,1394,22447})[flr(j*4%4)])
c(64+2*q*sin(m),64+q*d(s/2+m),q-9*d(m*3-s)*d(s/9),j+flr(j+.7)*16)end
?"torus\nknot",9,9
check_time()
flip()goto _