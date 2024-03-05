pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/axnjaxn/status/1400889311914958848

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


pal({[0]=0,1,5,8,9,10,7},1)n,k=sin,circfill::_::for i=0,2500do
x=rnd(128)y=rnd(128)k(x,y,1,max(pget(x,y)-1))end
u=t()c,s=cos(u/17),n(u/17)for i=1,3do
x=48*n(1/8-u/2)-16*n(.25+u/2)y=32*n(u)x,z=c*x-s,s*x+c
z=1+z/96k(64+x*z,64+y*z,8*z,7)u+=2/3end
check_time()
flip()goto _