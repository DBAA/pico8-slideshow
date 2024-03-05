pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/von_rostock/status/1335561340883251205  
--@von_rostock  neon jellyfish

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


c=cos::_::cls(3)m=t()r=0g=0h=0p=9+4*c(m)for b=0,1,.02do
pal(b*16,({-15,1,-4,12,6,7})[b*7\1],1)g+=.004+c(b-m)*b/69r+=c(g)h-=sin(g)l=1+b\.96*4for a=0,1,.02-b/99do
u=64+r*c(a)v=p+h+l*sin(a+b\.99/2)
if(a<.5)u=62+c(b-m+a\.17/3)*9*b+a*9v=p+b*99
pset(u,v,pget(u,v)+l)end
end
check_time()
flip()goto _
