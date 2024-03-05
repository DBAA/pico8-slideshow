pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/SLCMB/status/1517982042490904576

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


u=64e=128_set_fps(60)q=0poke(24404,96)t=e::a::t+=2z=rnd(1)x=cos(z)y=sin(z)sspr(x+5,y+5,118,118,-x,-y,e,e)if t>=e then
  p=t~=e and{7,12,13,9,12}or{1,13,14,15}t-=e+1circfill(u,u,8,p[1])end
  for i=0,9do
  q+=1a=q/450circ(u+9*cos(a),u+9*sin(a),1,p[flr(1+rnd(#p))])end
  check_time()
  flip()goto a
