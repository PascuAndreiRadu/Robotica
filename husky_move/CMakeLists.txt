cmake_minimum_required(VERSION 3.0.2)
project(husky_service)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  rospy
  std_msgs
)

add_service_files(
  FILES
  MoveHusky.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS geometry_msgs message_runtime rospy std_msgs
)

catkin_install_python(PROGRAMS
  src/Move_husky.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)