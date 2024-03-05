pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/0xsim/status/1463184226229047305?s=20

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


_set_fps(60)
pal({7,12,-4,-3,-11,-15,1},1)
camera(-64,-64)
::🅾️::
cls()
i=0
for y=-44,54,4 do
 i+=2
 for x=-64+(i%4),64,4 do
  a=x/80
  b=y/64
  dist=-(a*a+b*b)/2
  z=cos(-sin(t()*.15+dist/3))*10  
  pset(x,y+z*1.2,((z+10)/18)*6+1)
 end
end
flip()
check_time()
goto 🅾️
