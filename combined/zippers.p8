pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@picoter8 zippers
--https://twitter.com/picoter8/status/1346347724107624454

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

-- zippers #pico8 #tweetcart #tweetjam
::_::
cls()
for i=-12,136,12do
for j=-4,136,4do
x=i-64
y=j-64
s=3*(mid(-1,1,8*sin(y/200+cos(x/32-t()/8))))
+flr(j/4%2)*4
if(j!=-4)for k=0,3do line(i+s+k,j,n+k,m,7)end
n=i+s
m=j
end
end
flip()
check_time()
goto _
