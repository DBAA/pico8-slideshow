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


--https://twitter.com/GunTurtle/status/1453439374440341507

function s(n)
  n%=1return(n<.117 or n>.883)and sin(n*2)or cos((n-7/8)*2/3)end
  h=0::_::flip()cls(9)h+=1g=h\48pal({140,1,135},1)for p=0,1do
  camera(16-p*8,p*32-84)for i=g,g+2do
  for j=0,p do
  f=i/3+h/72for x=0,80+s(f)*16do
  circfill(x,s(x/512+f)*28,3-j*2+p*2,j+p+1)end
  end
  end
  end
  check_time()
  goto _