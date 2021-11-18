sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt update

sudo apt install -y ros-melodic-desktop-full

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
sudo rosdep fix-permissions

source /opt/ros/melodic/setup.bash
# echo "export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/ORB_SLAM2/Examples/ROS" >> ~/.bashrc
# source ~/.bashrc

sudo apt-get install -y ros-melodic-usb-cam
sudo cp ./resources/usb_cam.launch /opt/ros/melodic/share/usb_cam/launch/usb_cam.launch
sudo chmod a+rwx /opt/ros/melodic/share/usb_cam/launch/usb_cam.launch

# install PCL for ROS
sudo apt-get install -y libopenni2-dev ros-melodic-pcl-ros


