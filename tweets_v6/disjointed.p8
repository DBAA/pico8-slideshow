pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/lexaloffle/status/1583176774497996800

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


pal({8,11,10,140,[15]=7},1)::_::c,k=circfill,cos for i=24576,32767,4do poke4(i,$i/8)end for y=-2,0,.01do q,r=k(y*(.4+k(t()/31)/3))/2,k(t()/11+y/4)for i=0,5do a=k(t()/23)*q+i/6x,z=k(a)*r,sin(a)*r+1+cos(t()/19)poke(24414,17<<(i%3))c(64+x*64/z,128+y*64/z,2/z,15)end end check_time() flip()goto _