pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://mobile.twitter.com/theoremnd/status/1176332552006770689

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

c={}s={}l={0,12,7}for k=0,9 do
add(s,{i=9,j=9,a=0})end::_::cls()for z in all(s)do
z.a+=rnd(.2)-.1z.i+=sin(z.a)z.i%=128
z.j+=cos(z.a)z.j%=128add(c,{x=z.i,y=z.j,r=3,d=3})end
for o in all(c)do
e=8
if(o.d>0)e=l[o.r/3]
circfill(o.x,o.y,o.r,e)
if(o.r>8)o.d=-.3
o.r+=o.d
end
check_time()
flip()goto _