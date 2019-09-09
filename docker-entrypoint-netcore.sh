#!/bin/bash
set -e
echo "Starting generating sprite data."
dotnet script GenerateSpritesheetData.csx ./carts/spritesheet.json ./src/spritesheet.lua
echo "Sprite data generated successfully."