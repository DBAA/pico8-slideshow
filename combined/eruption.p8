pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/GregosEl/status/1391063118034477057

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

--eruption #pico8 #tweetcart
p={0x8400,0x8421,0x9c63,0xbde7,0xbdff,0xffff}
i={0x01,0,0,0x10,0x21,0x82,0xe8,0x8e,0x28}
t=0::a::
for n=64,1,-1 do
f=n+t%1
q=f/64
r=f*f/28
y=50+sin(q+.1)*r
c=n-t
fillp(p[flr(c%#p)+1])
circfill(64,y,r,i[flr(c/#p)%#i+1])
end
t+=.2
check_time()
flip()goto a