pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/trasevol_dog/status/963812687804354560
--@trasevol_dog ripple heart

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

g="2288ee77"fillp(3855)c=cos::s::cls()a={}o=24p=9
for i=0,1,.02 do
x=64+64*sin(i)^3y=52+20*c(2*i)-52*c(i)+8*c(3*i)k=o-x
for j=0,k,sgn(k) do
w=flr(x+j)z=j/k*p+y*(1-j/k)o=x
if(a[w])h=4+2*c(t()+w/99)+2*c(t()+w/9)rect(w,a[w]+h,w,z+h,"0x"..sub(g,h,h+1))
a[w]=z end p=y end 
check_time()
flip()goto s