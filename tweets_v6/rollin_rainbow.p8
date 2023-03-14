pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/Cypooos/status/1630861576851927041

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


nb = 15
sp = 5

camera(-64,-64)

function _draw()
  cls()
  for order=0,nb-1 do
    i = flr(sp*t()+order)%nb
    size = (((sp*t())%1)-order+nb-1)/nb
    size = min(1,2*size)
    
    x = 50*(1-size)*sin(i/nb)
    y = 50*(1-size)*cos(i/nb)
    circfill(x,y,50*size,8+i%8)
  end

  check_time()
end
