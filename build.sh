echo "Starting build."
p8tool build carts/coffee-central.p8 --lua src/main.lua --gfx carts/assets.p8
p8tool stats carts/coffee-central.p8
echo "Build successfull."