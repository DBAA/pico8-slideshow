pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

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


e=.009p=0::_::cls(2)p=p%1-e
for j=0,5 do
for i=0,1,e do
r=j%2*4g=64+cos(i)*(35+r)z=sin(i)*(17+r)y=64+cos(i*3)*12*(sin(i)/2+.5)
if(j<2)line(g,y-z,g,80-z,1+j%2*3)
if(j<4)line(g,y-z,u,v,6)
if(p-i>.5)i+=1
if(i<p+.05 and i>p)circfill(g,y-z-2,2,1)
u,v=g,y-z
end
end
check_time()
flip()goto _