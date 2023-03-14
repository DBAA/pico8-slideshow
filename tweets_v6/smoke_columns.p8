pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/TRASEVOL_DOG/status/954383069171077120

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


fillp(23130)e="1224499aaff77"v=cos::s::cls()u=t()/24w=sin
for y=0,127 do
z=y/999j=v(u+z)g=.2*w(j-u*3+z)k=14+3*v(w(z*4-u*9))for l=0,15 do
i=l/4x=64+16*w(j)+32*v(-g%.25+flr(i)/4)a=x+k*v(i+g)b=x+k*w(i+g)
if(a>b)d=flr(8/k*(a-b)+1)rect(a,y,b,y,"0x"..sub(e,d,d+1))end
end
check_time()
flip()goto s