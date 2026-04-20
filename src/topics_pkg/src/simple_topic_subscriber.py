#!/usr/bin/env python3
import rospy

from std_msgs.msg import Int32

rospy.init_node('topic_subscriber')

def callback(msg):
    print(msg.data)

sub = rospy.Subscriber('/counter',Int32,callback)
rospy.spin()