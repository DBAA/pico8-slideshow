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

--https://twitter.com/von_rostock/status/1490844590647431168

flip()
?"\^c0\^!5f1000█🐱♪="
a=0s=sin::_::a+=1
for x=a%4-64,63,4do
for y=a%3-32,31,3do
g=.005e=0u=x-t()*8v=y
for i=1,8do
g*=2e+=5*.6^i*(s(3^i/999*u+s(g*v+t()/32)/2)+s(g*v*2+s(g*u)/3))end
if(x^2+y^2<199and(x+8)^2+(y+8)^2>360)e=7-e/3
e*=cos(y/128)pset(x+64,y+64,mid(e,7))
end
end
check_time()
goto _