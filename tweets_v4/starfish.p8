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


t = 0
pal({-2, -1, -7})
::⭐️::
cls(1)
for r=0.09,1.09,0.2 do
for k=0,2 do
for g=0,1,0.04 do
 i=41*g+20
 j=2*sin(2*g+t)+4*k*g+64
 s,c=sin(r),cos(r)
 i-=64
 j-=64
 i,j=c*i-s*j+64,s*i+c*j+64
 circfill(i,j,0,k%3+1)
end
end
end
check_time()
flip()
t+=0.05
goto ⭐️
