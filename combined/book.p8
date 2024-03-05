pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--book by @2darray

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


::_::cls()for k=-1,1,2 do
for j=8-8*k,8+8*k,k do
x=59.5q=1-mid(2-t()/4%2-j/16,1)^2p=1-q
y=84.5+(16-j)/2*p+q*j/2w=q/2
for i=0,1,.02 do
c=6+j%2
if(j*i==0or j>15)c=4
if(sgn(x-60)==k)line(x,y,x+10,y-40,c)line(x,y,x+10,y-41)
x+=cos(w)y+=sin(w)w-=p*.035*q*(1-i)end
end
end
check_time()
flip()goto _
