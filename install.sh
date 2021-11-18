# source ~/.bashrc

OS_VERSION=$1

if [ "$OS_VERSION" = "2" ]
then
   OSV_DIR="ORB_SLAM2"
elif [ "$OS_VERSION" = "2c" ]
then
   OSV_DIR="ORB_SLAM2_CUDA"
elif [ "$OS_VERSION" = "3b" ]
then
   OSV_DIR="ORB_SLAM3_BETA"
else
   echo "invalid input: select from [2, 2c, 3b]"
   exit 1
fi

# copy over our custom selected ORB_SLAM version to the home folder
sudo rm -r --force ~/${OSV_DIR}
cp -fR ./OS_versions/${OSV_DIR} ~/${OSV_DIR}

# build ORB_SLAM
cd ~/${OSV_DIR}
chmod +x build.sh
./build.sh

# build ROS
cd ~/${OSV_DIR}
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/${OSV_DIR}/Examples/ROS
chmod +x build_ros.sh
./build_ros.sh


#sudo reboot





