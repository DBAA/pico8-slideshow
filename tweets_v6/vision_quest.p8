pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/jahndis/status/1570663053804589060?t=XeDOOSzl_QWZhlOhW2Rlxg&s=19

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
w,t,s,c,r=128,0,sin,cos,rnd::_::pal({1,2,8,9,10,12,13,14,7},0)for x=0,64 do?"웃",32,87,0
  a=38*(x+t*2)b=(x%27*9)%64line(a*2%w-9,b,a%w+9,b,9)for y=0,64 do
  n=s(x/w+t)+c(y/w+t)+s(y/w+t*3)*c(x/w+t)pset(x*2+r()*2,y*2+r()*2,y>48+r()+s(x/80)*4and 15or(3*n%3+t*4)%8+1)end
  end
  t+=.001
  check_time()
  goto _