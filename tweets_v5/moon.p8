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

--https://twitter.com/lucatron_/status/1111025092236959744


cls()
circfill(30,22,15,7)
::_::
flip()
srand()
rectfill(0,50,127,127,0)
for y=0,77 do
z=77/(y+1)
for i=0,z*8 do
x=(rnd(160)+t()*150/z)%160-16
w=cos(rnd()+t())*12/z
if(w>0)line(x-w,y+50,x+w,y+50,max(1,pget(x,49-y/2)))
end
end
check_time()
goto _