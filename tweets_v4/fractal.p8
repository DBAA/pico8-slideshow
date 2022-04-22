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

f=32s=f
l=line
function q(n,x,y)
if n>1then
for i=1/12,1,1/6do
m=n-1h=s*3^m*4q(m,x+cos(i)*h,y+sin(i)*h)end
q(n-1,x,y)else
for i=0,1,1/6do
l(x+cos(i)*6*s,y+sin(i)*6*s)end
l()end
end
j=1d=0::_::d=d%f+1t=3^j
l()cls()q(j,64,64)flip()j+=(d&f)/f
s-=(s-f/t)/2+d/t/4if(j>4)j,s=1,f
check_time()
goto _
