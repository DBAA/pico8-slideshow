pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/lexaloffle/status/1003303393572425731

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

r=rnd::_::srand()f=t()/9
cls()n=650+60*sin(f/3)for i=1,n do
a=f+r(1)d=.3+r(9)y=-3
if i>400 then j=i-400 y=j*2/n-1
a=j*40/n+f+j/3 d=j*3/n end
x=d*cos(a)z=2+cos(f)+d*sin(a)x=64+x*64/z
y=64+y*64/z c=6+i%5 e=5/z
if(z>.1)circfill(x,y,e,c)circfill(x,128-y,e,c/4)
end
check_time()
flip()goto _