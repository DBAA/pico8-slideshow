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

a,p,l=24337,poke4,line
p(a,0x038b.0b8a)p(a+4,0x81.0183)::_::cls(0)y,s=max(sin(t()/10)*5,sin(t()*3)*.04+.2),64
for z=20-t()%1*3,.1,-1 do
for x=-20+1/6,20,1/3 do
b,c,d=x*s/z+64,y*s/z+40,32/z
l(b,c,b,c-d,z/4+3)l(b,c-d,b-4*sin(t()/5)/z,c-38/z,max(1,(z-1)/2.5))
end end
check_time()
flip() goto _

