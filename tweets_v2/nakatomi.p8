pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/von_rostock/status/1250728794450726913  
--@von_rostock  nakatomi cleaner


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


r=16s=sin::_::for x=0,140,12 do
for y=-r,140 do
l=y+t()*30%r
if(y%r<1)w=s(x/299+s(l/400))/19pal({-15,1,-13,-4,12,rect(x,l,x-13,l+r,1),7,fillp(23130),9,-7,4,2,0,0,0},1)v=s(w)
k=cos(w)^6*l/8line(x,l-v,x+9,l+v,k+r*flr(k+.5))end
end
?"▮",27,91
?"+\nm",27,88
rect(r,99,41)
check_time()
flip()goto _

