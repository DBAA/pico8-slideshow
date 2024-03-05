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


--https://twitter.com/Andy_Makes/status/1512102681187393543

cls()
?"#tweetcart vol.5"
memcpy(0,24576,999)::_::cls()
for x=0,128do
for r=0,6do
l=4+x/10+sin(x/21+t())
y=38+r*l-x/10-sin(x/19+t())*3
if(sget((x/4+t()*12)%72,r)>0)line(x,y,x,y+l,8)
if(pget(x,y-1)!=8 and pget(x,y)==8)line(x,y,x+l,y-l,141)
end
end
check_time()
flip()goto _
--#pico8 #pixelart