pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/von_rostock/status/1307024364509028352

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

pal({-15,1,-13,-4,12,2,4,-7},1)r=rnd::_::srand()for y=9,148,8 do
  for x=0,128,28 do
  h=4+sin(r()+t()/(r()+.5))k=4+r(1.1)\1*5+r(1.2)for u=0,16 do
  a=min(sin(-u/32)*6\1,4)w=(u-x-14*(y\8%2)-t()*30)%128v=y-h*4line(w,v,w,y+a,k-1-min(u\4,1)-u\13)line(w,v-a,w,v+a,k)end
  end
  end
  check_time()
  flip()goto _

