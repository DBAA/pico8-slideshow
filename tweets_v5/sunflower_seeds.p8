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


--https://twitter.com/gamedevbrook/status/1498804023675260940

f=circfill
s=sin::_::z=s(t()/2)/16+1/8x=63+9*s(z)y=53-9*cos(z)f(x,y,30,10)for i=0,20do
c=i/20+.025+t()/80a=cos(c)b=s(c)for j=19,39do
f(x+a*j,y+b*j,4*s(j/40),9+i%2)end
f(x-9*s(z)*c,76+i*3,2,11)?"-",(i^2.3-192*t())%128,i^3.3%128,7
end
fillp(░\1)f(x,y,18,64)fillp()?"⁶1⁶cc"
check_time()
goto _