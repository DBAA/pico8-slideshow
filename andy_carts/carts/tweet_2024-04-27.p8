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


a=abs::_::cls()e=t()for r=0,46do
for p=0,1,.025do
j=sin(e)*20k=cos(e)*5f=1-p
h=a(17-p*34)v=a(23-r)c=1+min(23-v,17-h)%5/3\1*6u=(r-1)/80z=a(p-.2)if(e%1<.5)c=a(r-5)<5and z<u+.03and(r==5or z>u)and 8or 8-sgn(h+v-9)/2
g=r+39pset((64+j)*p+(64-j)*f,(g+k)*p+(g-k)*f,c)end
end
check_time()
flip()goto _



-- a=abs
-- ::_::
-- cls()
-- e=t()/2
-- for r=0,46do
-- for p=0,1,.025do
-- h=a(17-p*34)
-- v=a(23-r)
-- c=1+(min(23-v,17-h)%5/3)\1*6
-- z=a(p-.2)
-- if(e%1<.5)c=r<9and(z<r/80+.03and(z>r/80or r==5))and 8or 8-sgn(h+v-9)/2
-- j=sin(e)*20
-- k=cos(e)*5
-- f=1-p
-- pset((64+j)*p+(64-j)*f,(39+r+k)*p+(39+r-k)*f,c)
-- end
-- end
-- flip()goto _


-- a=abs
-- ::_::
-- cls()
-- e=0.25--t()/2
-- for r=0,46do
-- for p=0,1,.025do
-- h=a(17-p*34)
-- v=a(23-r)
-- c=1+(min(23-v,17-h)%5/3)\1*6
-- z=p-.2
-- if(e%1<.5)c=r<9and(a(z)<r/80+.03 and (a(z)>r/80 or r==5))and 8or 8-sgn(h+v-9)/2
-- j=sin(e)*20
-- k=cos(e)*5
-- pset((64+j)*p+(64-j)*(1-p),(39+r+k)*p+(39+r-k)*(1-p),c)
-- end
-- end
-- flip()goto _


--abs(p-.2)-r/80<0.2
-- abs(z+r/80)<.02 or abs(z-r/80)<.02


-- abs(z+5)<.02 or abs(z-5)<.02
-- min(abs(z+5),abs(z-5))<.02


-- if(abs(p-.2)-r/80<0.2)

--311

-- ::_::
-- cls()
-- e=t()/8
-- for r=0,46do
-- for p=0,1,.025do
-- h=abs(17-p*34)
-- v=abs(23-r)
-- c=1+(min(23-v,17-h)%5/3)\1*6
-- z=p-.2
-- if(e%1<.5)c=(r<9 and(abs(z+r/80)<.02 or abs(z-r/80)<.02 or r==5 and abs(z)<.09)) and 8 or 8-sgn(h+v-9)/2
-- j=sin(e)*20
-- k=cos(e)*5
-- pset((64+j)*p+(64-j)*(1-p),(39+r+k)*p+(39+r-k)*(1-p),c)
-- end
-- end
-- flip()goto _

--320


--k>48and 7or 9+i

-- ::_::
-- cls()
-- e=t()/8
-- for r=0,46do
-- for p=0,1,.025do
-- h=abs(17-p*34)
-- v=abs(23-r)
-- c=1+(min(23-v,17-h)%5/3)\1*6

-- if(e%1<.5)c=8-sgn(h+v-9)/2

-- if e%1<.5 and  then

-- if(r<9 and abs(p-.2+r/80)<.02 or abs(p-.2-r/80)<.02 or r==5 and abs(p-.2)<.09)c=8


-- end
-- pset((64+sin(e)*20)*p+(64-sin(e)*20)*(1-p),(39+r+cos(e)*5)*p+(39+r-cos(e)*5)*(1-p),c)
-- end
-- end
-- flip()goto _




-- ::_::
-- cls()
-- e=t()/8
-- for r=0,50do
--     for p=0,1,.02do

--         v=abs(25-r)
--         h=abs(20-p*40)

--         col = 1 + (min(25-v,20-h)%5/3)\1 * 6
--         if(e%1<.5)col=8-sgn(v+h-9)/2

--         pset((64+sin(e)*20)*p+(64-sin(e)*20)*(1-p),(39+r+cos(e)*5)*p+(39+r-cos(e)*5)*(1-p),col)
--     end
-- end

-- flip()goto _



-- ::_::
-- cls()
-- --e=sin(t()/8)*20
-- e=t()/8
-- for r=0,50 do
--     ax=64+sin(e)*20
--     ay=39+r+cos(e)*5
--     bx=64-sin(e)*20
--     by=39+r-cos(e)*5
--     for p=0,1,.02do
--         x=ax*p+bx*(1-p)
--         y=ay*p+by*(1-p)

--         col = 7

--         dv = abs(25-r)
--         dh = abs(20-p*40)

--         if(e%1<.5 and dv+dh<10)col=8

--         if(e%1>.5 and min(25-dv,20-dh)%5<2) col = 1

--         pset(x,y,col)
--     end
-- end

-- flip()goto _


-- ::_::
-- cls()
-- e=sin(t()/8)*20
-- for r=0,50 do
--     ax=64-e
--     ay=39+r
--     bx=64+e
--     by=35+r
--     for p=0,1,.02do
--         x=ax*p+bx*(1-p)
--         y=ay*p+by*(1-p)

--         col = 7

--         dv = abs(25-r)
--         dh = abs(20-p*40)

--         if(e<0 and dv+dh<10)col=8

--         if(e>=0 and min(25-dv,20-dh)%5<2) col = 1

--         pset(x,y,col)
--     end
-- end

-- flip()goto _
