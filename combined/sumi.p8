pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--sumi the squid by @beanborg
--https://twitter.com/neurodiversion/status/1336708062963527681

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


c=circfill::_::srand()cls(12)for i=1,8do
m=i%2for j=0,9do
o=2*cos(t()*j/7)c(32+7^i+o,80+8*j,7,2)c(24+8*i+o,80+(3+m)*j,3-j/4+2*m,1+12*m)c(60-4*cos(i/16)*j,9+7*j,7,13)c(42+24*(j%2),64,2+3*m,7*m)circ(rnd(128),(rnd(99)-4*i*t())%128,rnd(3),7)end
end
?"ウニとインク",36,9,0
check_time()
flip()goto _

