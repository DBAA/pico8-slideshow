pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/spug/status/1101991723922804736
--@spug golden circles

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

g=1.618n=12x={64}y={64}r={63}for i=2,n do
j=i-1x[i]=64y[i]=y[j]+(r[j]*(1-1/g))/2r[i]=r[j]*(1/g*1.2)end::_::cls()f=t()/n
circ(x[1],y[1],r[1])for i=2,n do
x[i]=x[i-1]+(r[i]/(2*g))*sin(f*(i+1/n)*g)y[i]=y[i-1]+(r[i]/(2*g))*cos(f*(i+1/n)*g)circ(x[i],y[i],r[i])end
check_time()
flip()goto _

