pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- stary sky / diamond eyes


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


::❖::
cls()
p=t()%1
for c=0,9do
for r=0,9do
x=c*16-32*p
y=r*16-32*p+(c%2)*8
pset(x+8,y-p*16,5)
m=min(7+sin(y/(70+sin(t()/3)*30))*3,(64-abs(x-64))/4)\1
for d=1,m do
line()
for i=0,1,.25do
line(x+cos(i)*d,y+sin(i)*d,d<m and 7+(d/2)%2or 2+(m/8)\1*10)
end
end
end
end
check_time()
flip()goto ❖


--261

-- ::_::
-- cls()
-- g=16
-- p=t()%1
-- buh=0
-- for c=0,160,g do
-- buh+=1
-- for r=0,160,g do
--     x=c-32*p
--     y=r-32*p+(buh%2)*8
--     ma=7+sin(y/(70+sin(t()/3)*30))*3
--     ma=min(ma, (64-abs(x-64))/4 )\1
--     for d=1,ma do
--     line()
--     for i=0,1,.25do
--     line(x+cos(i)*d,y+sin(i)*d,d<ma and 7+(d/2)%2 or 2+(ma/8)\1*10)
--     end
--     end
-- end
-- end
-- flip()goto _


--k>48and 7or 9+i

-- ::_::
-- cls()
-- g=16
-- p=(t())%1
-- buh=0
-- for c=0,160,g do
-- buh+=1
-- for r=0,160,g do
--     x=c-32*p
--     y=r-32*p+(buh%2)*8

--     ma=7+sin(y/(70+sin(t()/3)*30))*3
--     ma=min(ma, (64-abs(x-64))/4 )
--     for d=1,ma do
--     line()
--     for i=0,1,.25do
--     color=7+(d/2)%2
--     if(d>=ma-1)color=12
--     if(d>=ma-1 and ma<8)color=2
--     line(x+cos(i)*d,y+sin(i)*d,color)
--     end
--     end

-- end
-- end

-- flip()goto _
