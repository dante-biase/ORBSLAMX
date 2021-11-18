cd

sudo apt install -y libgl1-mesa-dev libglew-dev cmake

sudo apt install -y libpython2.7-dev python-pip python3-pip libjpeg-dev zlib1g-dev
sudo python -mpip install numpy pyopengl Pillow pybind11
sudo apt install -y pkg-config

sudo apt install -y \
	libegl1-mesa-dev libwayland-dev libxkbcommon-dev wayland-protocols \
	ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev \
	libavdevice-dev libdc1394-22-dev libraw1394-dev libuvc-dev libjpeg-dev \
	libpng-dev libtiff5-dev libopenexr-dev

# install OpenNI2
# install DepthSense SDK

cd
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
cmake --build . --config Release -- -j$((`nproc`+1))
sudo make install
cd




