pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@p01  bouncing spheres
--https://twitter.com/p01/status/1212737187315404807

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

flip()
cls()c={1,2,4,9,10,10,7,7,7,7}p=cos::_::a=t()/4s=p(a/4)for i=0,900 do
y=rnd(129)x=y%1*129g=64-y f=64-x e=0
z=abs(g)for h=a,a+3 do
r=16+8*p(h/3)u=f+48*p(h/4)v=g-abs(r*p(h*.9))r=r*r-u*u-v*v
if(r>0)e=max(e,1+r/88)end
circfill(x,y,1,c[flr(bxor(f/z+s,y/z+a)%2*z/26+e+y%1)])end
check_time()
goto _