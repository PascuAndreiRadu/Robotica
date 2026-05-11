#!/usr/bin/env python3
import rospy
import math
from geometry_msgs.msg import Twist

def draw_triangle():
    rospy.init_node('husky_triangle')
    Barosanii_pub = rospy.Publisher('/husky_velocity_controller/cmd_vel', Twist, queue_size=10)
    Barosanii_rate = rospy.Rate(10)
    

    speed = 0.5               
    straight_duration = 3.0   
    
    turn_speed = 0.5          
    turn_angle = 120.0 * (math.pi / 180.0) 
    turn_duration = turn_angle / turn_speed
    
    rospy.loginfo("Start")
    
    stop_msg = Twist()

    while not rospy.is_shutdown():
        
        for i in range(3):
            
            rospy.loginfo(f"Partea {i+1}")
            move_msg = Twist()
            move_msg.linear.x = speed
            
            start_time = rospy.Time.now().to_sec()
            while rospy.Time.now().to_sec() - start_time < straight_duration and not rospy.is_shutdown():
                Barosanii_pub.publish(move_msg)
                Barosanii_rate.sleep()
                
            Barosanii_pub.publish(stop_msg)
            rospy.sleep(0.5)
            
            rospy.loginfo(f"Coltul {i+1}, intoarce 120 grade")
            Barosanii_turn_msg = Twist()
            Barosanii_turn_msg.angular.z = turn_speed
            
            start_time = rospy.Time.now().to_sec()
            while rospy.Time.now().to_sec() - start_time < turn_duration and not rospy.is_shutdown():
                Barosanii_pub.publish(Barosanii_turn_msg)
                Barosanii_rate.sleep()
                
            Barosanii_pub.publish(stop_msg)
            rospy.sleep(0.5)
            
        rospy.loginfo("Triunghi complet")
        rospy.sleep(2.0)

if __name__ == "__main__":
    draw_triangle()