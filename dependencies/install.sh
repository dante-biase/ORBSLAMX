# update system
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# install dependencies
cd ./scripts

## reinstall opencv with full CUDA support: https://github.com/mdegans/nano_build_opencv
chmod +x ./reinstall_opencv.sh
./reinstall_opencv.sh

## install pangolin: https://github.com/stevenlovegrove/Pangolin
chmod +x ./install_pangolin.sh
./install_pangolin.sh

## install Eigen3
sudo apt install -y libeigen3-dev

## install ROS: http://wiki.ros.org/melodic/Installation/Ubuntu
chmod +x ./install_ros.sh
./install_ros.sh

## install Kinect ROS driver
chmod +x ./install_ms_kinect_sdk.sh
./install_ms_kinect_sdk.sh

## install other dependencies
chmod +x ./install_other.sh
./install_other.sh

# cleanup
sudo rm -r --force ~/nano_build_opencv ~/Pangolin

# reboot system
sudo reboot






