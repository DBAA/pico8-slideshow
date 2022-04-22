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

--https://twitter.com/sourencho/status/1491036057160278019?s=21



?"\^!5f100▒1⬇️3⬅️;⌂"
n=600
::🌬::
cls(0)
p=2.2929
for i=0,n do
f=p*i
y=1-(i/n*2)
r=sqrt(1-y*y)
x=cos(f)*r
z=sin(f)*r
b=(x+z*1.3)+3.3
b=b^5/700
x=64+x*30
y=64+y*30
srand(i)
u=4*sin(t()/3)+3
v=5*abs(cos(rnd()+t()))
line(x,y,x+u,y+v,1.5*(b+1))
end
check_time()
flip()
goto 🌬