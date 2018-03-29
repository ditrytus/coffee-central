#!/bin/bash
set -e
echo "Starting build."
/picotool/p8tool build --lua /src/main.lua --gfx /carts/assets.p8 $1
/picotool/p8tool stats $1
echo $1 " built successfully."