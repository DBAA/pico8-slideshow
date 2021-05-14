pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--lost planet by @andy_makes
--https://twitter.com/andy_makes/status/1392477166542200836

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


--lost planet
w=128s=sin
pal({131,12,131,9,10,14,136,137},1)
flip()
::_::
x=rnd(w)
y=rnd(w)
e=t()
a=0
c=x
r=y
if sqrt((x-64)^2+(y-64)^2)<40 then
a=2
e/=3
c=w-x
r=w-y
end
p=3+(s(x/160+e/2)+cos(y/220+s(e/8))+s(x/w)/2+s(e*cos(y/72-e))/5+cos(x/70+y/40+e)/5)*2
if(p<1)p=7
pset(c,r,p+a)
check_time()
goto _