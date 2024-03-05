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

--https://twitter.com/gamedevbrook/status/1495480135876845577

poke(24364,5)?"\^!5f11░"
c=circfill::_::c(63,199,130,1)m=80+6*sin(t()/4)c(33,m,9,4)for a=0,4do
f=a\4*.1+a/14-.1l=3+cos(f*2)line(50-l,20+a,50+l*2,20+a,5)c(50,23,1,0)
for b=0,9,.5do
e=f-b/199x=b*l*cos(e)y=b*l*sin(e)c(38-x,m+y,2,4)c(39+12*a,99+b,4,-1)end
end
flip()cls()
check_time()
goto _

