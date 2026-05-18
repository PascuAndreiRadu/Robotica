#!/usr/bin/env python3
import rospy
import actionlib
from geometry_msgs.msg import Twist
from husky_action.msg import HuskyMoveAction, HuskyMoveFeedback, HuskyMoveResult

class HuskyActionServer:
    def __init__(self):
        self._as = actionlib.SimpleActionServer(
            "Barosanii_action_server", 
            HuskyMoveAction, 
            execute_cb=self.execute_callback, 
            auto_start=False
        )
        
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        
        self._as.start()
        rospy.loginfo("Serverul de actiune pentru Husky a pornit.")

    def execute_callback(self, goal):
        feedback = HuskyMoveFeedback()
        result = HuskyMoveResult()
        rate = rospy.Rate(1) 
        
        move_cmd = Twist()
        command = goal.command.upper()
        target_distance = goal.distance
        
        if target_distance <= 0:
            rospy.logerr("Distanta trebuie sa fie mai mare decat 0.")
            self._as.set_aborted()
            return

        if command == "FORWARD":
            move_cmd.linear.x = 0.5
            feedback.status = "Moving forward"
        elif command == "BACKWARD":
            move_cmd.linear.x = -0.5
            feedback.status = "Moving backward"
        else:
            rospy.logerr(f"Comanda invalida: {command}")
            self._as.set_aborted()
            return

        speed = abs(move_cmd.linear.x)
        total_duration = target_distance / speed
        start_time = rospy.Time.now().to_sec()
        
        rospy.loginfo(f"Se executa miscarea Husky: {command} pentru {target_distance} metri.")

        while (rospy.Time.now().to_sec() - start_time) < total_duration:
            if self._as.is_preempt_requested():
                rospy.loginfo("Comanda a fost anulata. Oprim robotul Husky.")
                self.stop_husky()
                self._as.set_preempted()
                return
            
            self.cmd_vel_pub.publish(move_cmd)
            
            elapsed_time = rospy.Time.now().to_sec() - start_time
            distance_traveled = elapsed_time * speed
            feedback.distance_remaining = max(0.0, target_distance - distance_traveled)
            
            self._as.publish_feedback(feedback)
            rate.sleep()

        self.stop_husky()
        rospy.loginfo("Husky a ajuns la destinatie.")
        self._as.set_succeeded(result)

    def stop_husky(self):
        stop_cmd = Twist()
        self.cmd_vel_pub.publish(stop_cmd)

if __name__ == '__main__':
    rospy.init_node('Barosanii_action_node')
    server = HuskyActionServer()
    rospy.spin()