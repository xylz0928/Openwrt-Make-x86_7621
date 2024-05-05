#!/bin/bash
set -e
cd ~
git clone https://github.com/coolsnowwolf/lede
cd lede
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-x86-part1.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-hanwckf-part2.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/MakeMenu.x86.config
bash diy-x86-part1.sh && \
./scripts/feeds update -a && ./scripts/feeds install -a && \
bash diy-hanwckf-part2.sh

cp MakeMenu.360T7_108M.config .config

make download && \
make -j16 V=s
