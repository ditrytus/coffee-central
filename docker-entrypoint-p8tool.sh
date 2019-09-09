#!/bin/bash
set -e
echo "Starting building cartridge."
/picotool/p8tool build --lua /src/main.lua --gfx /carts/assets.p8 $1
echo "Cartridge built successfully."