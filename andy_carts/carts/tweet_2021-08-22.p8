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

--vases
pal({137,136,8,14},1)
::🏺::
cls()
e=t()/9
for x=9,119,14do
for k=0,3 do
b=e*(1+x/70)
for i=b,b+1,.04do
a=i*(1-k%2*2)
r=cos(a)
m=25+sin(x/99+e*2+k/2)*10
y=(64*k+sin(a)*m + e*256)%256 - 64
s=3+r*2
circ(x+r*4,y,s,1+k)
end
end
end
check_time()
flip()goto 🏺
--#tweetcart #pico8 #pixelart

