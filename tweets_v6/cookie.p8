pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/deerinheadligh8/status/1565562326807453696

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



h=sin
r=rectfill::_::t=time()cls(12)s={4,5,6,7,8,8,8,8,7,7,6,5,4}function o(z,x,y)a=x-z/2b=x+z/2-1r(a,y+1,b,y+10,0)r(a+1,y,b-1,y+11)r(a,y+3,b,y+8,7)end
for i=1,13 do
d=cos(i/26)o(s[i]*4,64+h(t/2)*5.2*d,60+h(t)*4.3*d)end
check_time()
flip()goto _