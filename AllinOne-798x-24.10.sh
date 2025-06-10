#!/bin/bash
set -e
cd ~
git clone https://github.com/padavanonly/immortalwrt-mt798x-24.10
cd immortalwrt-mt798x-24.10
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-x86-part1.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/diy-24.10-part2.sh && \
wget https://github.com/xylz0928/Openwrt-Make-x86_7621/raw/main/MakeMenu.360T7_108M.24.10.config
bash diy-x86-part1.sh && \
./scripts/feeds update -a && ./scripts/feeds install -a && \
bash diy-24.10-part2.sh

cp MakeMenu.360T7_108M.24.10.config .config

make download && \
make -j16 V=s
