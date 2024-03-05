pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://mobile.twitter.com/ctinney94/status/1629891775962791937

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

::s::cls(1)rectfill(14,46,113,114,8)for k in all({-1,0,6,2,1}) do
  r=t()/3%.5m=mid(r-k+.75,-.25,.25)
  for i=0,1,.01 do
  c=7
  if(k==0 and r*4>i+.75)c=6
  if(k==2 and 1.2-i>r*4)c=6
  e=64z=cos(m*i)
  if(k%7==6)e+=2z*=.2c=13
  x=64+sin(m*i)*i*48y=48-z*i*32
  line(x,y,x,y+e,c)end
  end
  check_time()
  flip()goto s

