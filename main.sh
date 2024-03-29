#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone --recurse-submodules https://github.com/end-4/eww
cd eww
git checkout trigonometry
cp -rvf ../debian ./
cp -vf ../Makefile ./Makefile

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
