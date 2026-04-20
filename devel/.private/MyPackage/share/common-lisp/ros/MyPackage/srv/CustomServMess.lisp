; Auto-generated. Do not edit!


(cl:in-package MyPackage-srv)


;//! \htmlinclude CustomServMess-request.msg.html

(cl:defclass <CustomServMess-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CustomServMess-request (<CustomServMess-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomServMess-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomServMess-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name MyPackage-srv:<CustomServMess-request> is deprecated: use MyPackage-srv:CustomServMess-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomServMess-request>) ostream)
  "Serializes a message object of type '<CustomServMess-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomServMess-request>) istream)
  "Deserializes a message object of type '<CustomServMess-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomServMess-request>)))
  "Returns string type for a service object of type '<CustomServMess-request>"
  "MyPackage/CustomServMessRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomServMess-request)))
  "Returns string type for a service object of type 'CustomServMess-request"
  "MyPackage/CustomServMessRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomServMess-request>)))
  "Returns md5sum for a message object of type '<CustomServMess-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomServMess-request)))
  "Returns md5sum for a message object of type 'CustomServMess-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomServMess-request>)))
  "Returns full string definition for message of type '<CustomServMess-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomServMess-request)))
  "Returns full string definition for message of type 'CustomServMess-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomServMess-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomServMess-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomServMess-request
))
;//! \htmlinclude CustomServMess-response.msg.html

(cl:defclass <CustomServMess-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CustomServMess-response (<CustomServMess-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomServMess-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomServMess-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name MyPackage-srv:<CustomServMess-response> is deprecated: use MyPackage-srv:CustomServMess-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomServMess-response>) ostream)
  "Serializes a message object of type '<CustomServMess-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomServMess-response>) istream)
  "Deserializes a message object of type '<CustomServMess-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomServMess-response>)))
  "Returns string type for a service object of type '<CustomServMess-response>"
  "MyPackage/CustomServMessResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomServMess-response)))
  "Returns string type for a service object of type 'CustomServMess-response"
  "MyPackage/CustomServMessResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomServMess-response>)))
  "Returns md5sum for a message object of type '<CustomServMess-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomServMess-response)))
  "Returns md5sum for a message object of type 'CustomServMess-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomServMess-response>)))
  "Returns full string definition for message of type '<CustomServMess-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomServMess-response)))
  "Returns full string definition for message of type 'CustomServMess-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomServMess-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomServMess-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomServMess-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CustomServMess)))
  'CustomServMess-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CustomServMess)))
  'CustomServMess-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomServMess)))
  "Returns string type for a service object of type '<CustomServMess>"
  "MyPackage/CustomServMess")