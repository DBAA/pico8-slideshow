pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/lexodden/status/1587940291130314753

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


pal({2,136,8,137,9,10,138,11,139,3,131,1,140,12,13,141},0)r,f=.1,16::_::cls()for x=-r,130,r do y=63+(cos(x/f-t()*4)*(8+cos(x/63)*8))+sin(t()/4+x/120)*10circfill(px,py,sin(t()-x/250)*2,sin(x/512-t()/8)*16)px,py=x,y end check_time() flip()goto _