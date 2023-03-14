pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/axnjaxn/status/1448048012861661184

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

::_::for i=0,339do
poke(i,ord("h-T~GUr_$F71TOW+Z,,[ty]}ww-[MA5,L\\?46\\(nQdF-#'p84QLyf\\5*vU&)s4'pUOrDi99hRqu;T<8LWu!2<zs Z<pTaux)@Y5hdhwwEaE!sHWgHz9Nf(_iV }/Wdlfkg3_kyiq",i+1))x=16+rnd(103)circfill(x,rnd(125),x*t()*i%2,7,i%5>0or srand(%(i\5*2)+i^.4\7*32896))end?"\^1\^c"
check_time()
goto _
