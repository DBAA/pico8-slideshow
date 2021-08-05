pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/munrohoberman/status/1334164843113418754

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

o,c=ovalfill,circfill::_::v=sin(t()/8+.7)*18-22camera(-63,-99)for i=9,13do
for k=0,9do
fillp(23130)x=i+k/4y=-k-v*(9-i)
o(x,y-i/2,-x,y+i/2,k>8and 136or 36)fillp()end
o(i/2,y-i/4,-i/2,y+i/4,7)o(i/4,y-i/8,-i/4,y+i/8,8)end
flip()cls(1)for i=0,9do
c(0,i*2,3,7)end
c(5,20)c(-5,20)
check_time()
goto _

