pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/von_rostock/status/1339009641074843648

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

pal({-16,-16,-14,-14,2,2,-8,-8,8,8},1)s=sin::_::c=t()%4
if(c<.1)m=rnd(19)n=rnd(19)cls(10)
for i=0,7do
u=m+54v=n+54for j=0,c*64do
g=u/512h=v/512k=i/8for l=1,5do g*=2h*=2k+=.5^l*(s(s(g)+s(h))+s(g*2)+t()%32/(1+j/3))/2end
u+=cos(k)/2v-=s(k)/2pset(u,v,max(pget(u,v)-1))end
end
check_time()
flip()
goto _