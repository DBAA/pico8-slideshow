pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--@oakreef  wormhole
--https://twitter.com/oakreef/status/1391077891304271873

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


-- #pico8 #tweetcart
t,s=0,{}::_::cls()r=rnd
add(s,{r()-.5,r()-.5})add(s,{r()-.5,r()-.5})
for j=1,#s do
p=s[j]
p[1]*=1.15
p[2]*=1.15
pset(p[1]+74,p[2]+60,7)end
for i=0,120,6 do
q=t-i
h=3^(q%60/15)circ(64+cos(q/60)*10,64+sin(q/60+0.2)*5,h,flr(h)%2>0.5 and 12 or 13)end
t+=1
check_time()
flip()goto _