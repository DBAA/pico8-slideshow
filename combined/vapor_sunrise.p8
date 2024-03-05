pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/spug/status/1090559155436511232
--@spug vapor sunrise


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


c=circfill
g=90n=15h=128t=0s=110p=clip::_::s=max(s-.1,50)cls(1)rectfill(0,g,h,h,0)p(0,0,h,g)c(64,s,20,14)p(0,g,h,h)c(64,180-s,20,13)for i=0,4 do
x=g+(i*3+i^2)line(0,x,h,x,12)end
t-=.5for i=0,n do
z=i*n+t%n
y=h*n/z+32v=i+t%n/n-n/2line(v*9+64,g,v*60+64,h,12)end
check_time()
flip()goto _