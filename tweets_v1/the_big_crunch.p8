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


i,p,l=24337,poke4,line
p(i,0x090a.8707)p(i+4,0x8084.0489)
::_::cls(0)camera(-64,-64)
u,z=1.5,t()s=z%u
for e=s,s+600,u do
 d,w,a=e*10,1/(cos(z/12)*2.98+5),e/32
for i=a,a+1,w do
 j=i+w
 if(i>a+1-w)j=a
 l(cos(i)*d,sin(i)*d,cos(j)*d,sin(j)*d,(z-e-5)/u%8+1)
end
end
check_time()
flip()goto _

