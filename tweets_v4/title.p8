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

cls()
flip()

w=129
pal({135,11,138,140,w,1},1)cls()
?"#tweetcart"
?"gallery",6,6
?"   4"
memcpy(0,24576,8192)cls()a={}
::_::for x=1,w do
if(#a<x)a[x]={y=-50,c=0}
y=a[x].y
pset(x-1,y,a[x].c+1+sget(x/3-2,y/5-5)/2)
a[x].c=(a[x].c+rnd()/w)%3
if(rnd()<.03)a[x].y+=1
if(a[x].y>w)a[x].y=0
end
check_time()
goto _

