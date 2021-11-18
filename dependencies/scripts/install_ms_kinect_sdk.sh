# install dependencies
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/multiarch/prod
sudo apt-get update

sudo apt install -y k4a-tools libk4a1.4-dev

sudo cp ./resources/99-k4a.rules /etc/udev/rules.d/

# update Kinect firmware if necessary:
# -> download firmware from https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues
# -> call "AzureKinectFirmwareTool -u /path/to/new_firmware.bin"

sudo apt-get install -y python-catkin-tools


# copy over custom catkin workspace to build Kinect ROS driver
sudo rm -r --force ~/catkin_ws
cp -fR ./resources/catkin_ws ~/catkin_ws

# copy over corrected cv_bridge file for OpenCV 4
sudo rm /opt/ros/melodic/share/cv_bridge/cmake/cv_bridgeConfig.cmake
sudo cp ./resources/cv_bridgeConfig.cmake /opt/ros/melodic/share/cv_bridge/cmake/cv_bridgeConfig.cmake

# build and install the driver
cd ~/catkin_ws
source ./devel/setup.bash
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release --force-cmake
catkin_make install
