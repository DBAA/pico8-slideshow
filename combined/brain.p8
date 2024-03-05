pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/gamedevbrook/status/1500832878837612550

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

cls()c=circfill
for i=0,13do
j=i/20x=29*j*sin(j)y=29*j*cos(j)c(61-x,70+y,13,-2)c(63,87+3*i,2,2)end
flip()
::_::x=rnd(128)y=rnd(128)z=pget(x,y)n=0for i=0,3do
a=cos(i/4)b=sin(i/4)if(pget(x+a,y+b)==2)n+=1end
if(z>9and n==1)c(x,y,0,2)
if(z<2)c(x,y,0,((x/8-7)^2+(y/8-8)^2+t()*4)/9%2)
check_time()
goto _
