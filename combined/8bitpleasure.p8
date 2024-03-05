pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--8 bit pleasures by @gregosel 
--https://twitter.com/gregosel/status/1391061094987358208

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


--endless pleasures #pico8 #tweetcart
camera(-64,-20)::_::srand()cls()
f=(sin(t()/64+.25))*256+260
for n=0,88,3 do
h=0o=n
for x=-32,32 do
p=max(0,1-abs(x)/24)
p*=cos(-t()/4-n/f)+1.1
if(rnd()<.3)h=rnd(6)
y=n-flr(h*p)
line(x,y+1,x,y+9,0)
line(x-1,o,x,y,7)
o=y
end
end
check_time()
flip()goto _