echo "Building ROS nodes"

cd Examples/ROS/ORB_SLAM3_BETA
mkdir build
cd build
cmake .. -DROS_BUILD_TYPE=Release
make -j1
