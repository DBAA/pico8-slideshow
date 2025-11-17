pico-8 cartridge // http://www.pico-8.com
version 16
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

--white
--white/blue
--blue
--purple/blue
--purple
--white/purple

p={{85,21,17,16,0,5},{102,22,17,29,221,214},{119,199,204,207,255,247}}f={6746,13260}l=flr::_::for d=0,17do
z=t()*3k=d+z%1fillp(f[1+l(d/9)])for a=z,z+1,.02do
b=z/5+k^.5/5circfill(64+sin(b)*15+sin(a)*k*5,64+cos(b)*9+cos(a)*k*5,5,p[min(1+flr(d/3),3)][1+l(z-d)%6])end
end
check_time()
flip()goto _

--t=0
-- p={{85,21,17,16,0,5},{102,22,17,29,221,214},{119,199,204,207,255,247},}
-- f={23130,13260}
-- ::_::
-- z=t()
-- camera(-64,-64)
-- for d=0,19 do
--   k=d+z%1
--   fillp(f[1+flr(d/10)])
--   for a=z,z+1,.02 do
--     b=z/5+(k^.5)/5
--     circfill(sin(b)*15+sin(a)*k*5,cos(b)*9+cos(a)*k*5,5,p[min(1+flr(d/3),3)][1+flr(z-d)%6])
--   end
-- end
-- flip()goto _

-- t=0
-- p={{85,21,17,16,0,5},{102,22,17,29,221,214},{119,199,204,207,255,247},}
-- f={23130,13260}
-- ::_::
-- t+=.13
-- camera(-64,-64)
-- for d=0,19 do
--   k=d+t%1
--   fillp(f[1+flr(d/10)])
--   for a=t,t+1,.02 do
--     b=t/5+(k^.5)/5
--     circfill(sin(b)*15+sin(a)*k*5,cos(b)*9+cos(a)*k*5,5,p[min(1+flr(d/3),3)][1+flr(t-d)%6])
--   end
-- end
-- flip()goto _






-- ::_::
-- cls(1)
-- t+=.008
-- t()

-- for k=1,5 do
-- for c=-20,150 do
--   y=-30+sin(t*(k+1)+c*.01)*10 + sin(k*.3-c*.00003*c)*6 + k*26 +sin(t+k*.3) * 5
--   line(c,y,c,y+128,k+1)
--   if(c%2==0)line(c,y,c-20,y+20,k)
-- end
-- end

-- flip()
-- goto _