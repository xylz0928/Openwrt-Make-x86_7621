#!/bin/bash -e
cd ~
git clone https://github.com/coolsnowwolf/lede
cd lede
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-x86-part1.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-x86-part2.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/MakeMenu.x86.config
bash diy-x86-part1.sh && \
./scripts/feeds update -a && ./scripts/feeds install -a && \
bash diy-x86-part2.sh

cp MakeMenu.x86.config .config

make download && \
make -j16 V=s
