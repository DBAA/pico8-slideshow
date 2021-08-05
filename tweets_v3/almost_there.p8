pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/lexaloffle/status/1404441741134995465

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


q,r,s,m=0,rectfill,64,rnd
::_::
cls(1)
q+=1/s
--?"\^1\^c1"
for i=1,99do pset(i*4-s,i*i%142,6)end
for j=-3,5do line(0)for i=-2,2,1/64do
t=i+q%1z,x,y=3+t*4,2-t*8+j\3,sin((i%1)/2)+.5+j%3w,u,v=9/z,s+x*s/z,s-y*s/z
if(i+j\3==i\1and z>0)r(u-w,v,u+w,127)r(u-w*9,v,u+w*9,v+w)
line(u,v)end end 
check_time()
flip()
goto _