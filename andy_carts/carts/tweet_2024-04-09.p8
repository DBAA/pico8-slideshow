pico-8 cartridge // http://www.pico-8.com
version 29
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


--jelly maze
t=0
g=0
::✜::
cls()
g+=1/60
t+=mid(0,sin(g)+.5,1)*.03
for j=0,1do
for c=0,128,8do
for r=0,128,8do
srand(c*99+r)
v=sin(t+rnd())*9
w=mid(8,1,v)
h=mid(-8,-1,v)
rectfill(c-w+j,r-h+j,c+w+j,r+h+j,7+j)
end
end
end
check_time()
flip()goto ✜




-- pal({15,143,142,135,9,136,5},1)

-- t=0
-- ::_::
-- cls()
-- t+=1/90

-- for c=0,16do
-- for r=0,16do
-- rectfill(c*8,r*8,c*8+8,r*8+8,1+(c+r+t*30)%6)
-- end
-- end

-- for j=0,1do
-- for c=0,128,8do
-- for r=0,128,8do
-- srand(c*99+r)
-- v=sin((t+rnd())%1)*9
-- w=mid(8,1,v)
-- h=mid(-8,-1,v)
-- rectfill(c-w+j,r-h+j,c+w+j,r+h+j,7+j)
-- end
-- end
-- end


-- flip()
-- goto _
