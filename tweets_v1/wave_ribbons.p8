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

t=0
pal({1,2,8,9,10,11},1)
::🌊::
cls(1)t+=.008
for k=1,5 do
for c=-20,150 do
y=-30+sin(t*(k+1)+c*.01)*10+sin(k*.3-c*.00003*c)*6+k*26+sin(t+k*.3)*5line(c,y,c,y+128,k+1)
if(c%2==0)line(c,y,c-20,y+20,k)
end
end
check_time()
flip()goto 🌊

