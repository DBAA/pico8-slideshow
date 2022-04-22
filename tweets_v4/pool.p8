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

f,s=flr,sin
function m(u,v,k)return(f(u/k)+f(v/k))%3-2*((s(u/19/k+s(v/9/k))+s(v/16/k-t()/4+s(u/6/k)))/2)^8 end::_::x=f(rnd(128))pal(x%16+1,({-15,1,-4,12,6,7})[x%16+1],1)y=rnd(128)j=sgn(63-x)c=m(x,y+x/2*j,16)+j%3
if(x+y*2>192 and y*2>x+64)c=m(x-y*2,y*2+x,32)+3
pset(x,y,c)
check_time()
goto _