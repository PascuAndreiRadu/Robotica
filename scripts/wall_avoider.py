#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
class WallAvoider:
    def __init__(self):
        rospy.init_node('wall_avoider', anonymous=True)
        self.cmd_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        rospy.Subscriber('/scan', LaserScan, self.scan_callback)
        self.rate = rospy.Rate(10)  # 10 Hz
        rospy.loginfo("Wall Avoider Node Started")

    def get_range(self, scan_data, angle_min_deg, angle_max_deg):
        import math
        ranges = scan_data.ranges
        angle_min = scan_data.angle_min
        angle_increment = scan_data.angle_increment

        min_range = float('inf')
        for i, r in enumerate(ranges):
            angle_rad = angle_min + i * angle_increment
            angle_deg = math.degrees(angle_rad)

            if angle_min_deg <= angle_deg <= angle_max_deg:
                if scan_data.range_min < r < scan_data.range_max and not math.isnan(r) and not math.isinf(r):
                    min_range = min(min_range, r)

        return min_range

    def scan_callback(self, scan_data):
        twist = Twist()
        front = self.get_range(scan_data, -30, 30)   
        right = self.get_range(scan_data, -90, -31)  
        left  = self.get_range(scan_data,  31,  90)  
        rospy.loginfo(f"Front: {front:.2f} | Left: {left:.2f} | Right: {right:.2f}")
        THRESHOLD = 1.0  
        if front < THRESHOLD:
            rospy.loginfo("LEFT")
            twist.linear.x  = 0.0
            twist.angular.z = 0.5
        elif right < THRESHOLD:
            rospy.loginfo("lEFT")
            twist.linear.x  = 0.1
            twist.angular.z = 0.5
        elif left < THRESHOLD:
            rospy.loginfo("RIGHT")
            twist.linear.x  = 0.1
            twist.angular.z = -0.5
        else:
            rospy.loginfo("FORWARD")
            twist.linear.x  = 0.3
            twist.angular.z = 0.0
        self.cmd_pub.publish(twist)
    def run(self):
        rospy.spin()


if __name__ == '__main__':
    try:
        node = WallAvoider()
        node.run()
    except rospy.ROSInterruptException:
        pass