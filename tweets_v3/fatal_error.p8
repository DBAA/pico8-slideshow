pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/cbmakes/status/1348119425929637890

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


cls(13)
poke(0x5f2c,3)
pal(1,140,1)
r=rectfill
k=rect
a=2
c=3
f=40
t=30
::_::
a+=2
c+=2
if(a>60)a=-10
if(c>60)c=rnd(30)-10
k(a-1,c-1,a+f+1,c+t+1,6)
r(a,c,a+f,c+t,6)
k(a,c,a+f,c+t,1)
r(a,c,a+f,c+5,1)
?"- 𝘹",a+28,c,7
?"𝘦𝘳𝘳𝘰𝘳",a+11,c+10,0
r(a+24,c+23,a+36,c+26,5)
flip()
check_time()
goto _

