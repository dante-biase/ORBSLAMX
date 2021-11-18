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

echo ""
echo "${OSV_DIR} INSTALLATION TEST"
printf -- '-%.0s' {1..100}; echo ""
printf -- '-%.0s' {1..100}; echo ""
printf -- '-%.0s' {1..100}; echo ""

killall roslaunch
killall rosrun
wait

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/${OSV_DIR}/Examples/ROS
source ~/.bashrc
roslaunch /opt/ros/melodic/share/usb_cam/launch/usb_cam.launch &
sleep 8

cd ~/${OSV_DIR}/Examples/ROS/${OSV_DIR}

if [ "$OS_VERSION" = "2c" ]
then
    # rosrun rviz rviz /camera/image_raw:=/usb_cam/image_raw &
    roslaunch ./launch/ros_mono.launch bUseViewer:=true /camera/image_raw:=/usb_cam/image_raw
else
    chmod +x Mono
    rosrun ${OSV_DIR} Mono ~/${OSV_DIR}/Vocabulary/ORBvoc.txt ~/${OSV_DIR}/Examples/ROS/${OSV_DIR}/Asus.yaml /camera/image_raw:=/usb_cam/image_raw
fi

