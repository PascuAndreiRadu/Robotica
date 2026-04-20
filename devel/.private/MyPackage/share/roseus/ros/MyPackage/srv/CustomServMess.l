;; Auto-generated. Do not edit!


(when (boundp 'MyPackage::CustomServMess)
  (if (not (find-package "MYPACKAGE"))
    (make-package "MYPACKAGE"))
  (shadow 'CustomServMess (find-package "MYPACKAGE")))
(unless (find-package "MYPACKAGE::CUSTOMSERVMESS")
  (make-package "MYPACKAGE::CUSTOMSERVMESS"))
(unless (find-package "MYPACKAGE::CUSTOMSERVMESSREQUEST")
  (make-package "MYPACKAGE::CUSTOMSERVMESSREQUEST"))
(unless (find-package "MYPACKAGE::CUSTOMSERVMESSRESPONSE")
  (make-package "MYPACKAGE::CUSTOMSERVMESSRESPONSE"))

(in-package "ROS")





(defclass MyPackage::CustomServMessRequest
  :super ros::object
  :slots ())

(defmethod MyPackage::CustomServMessRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass MyPackage::CustomServMessResponse
  :super ros::object
  :slots ())

(defmethod MyPackage::CustomServMessResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass MyPackage::CustomServMess
  :super ros::object
  :slots ())

(setf (get MyPackage::CustomServMess :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get MyPackage::CustomServMess :datatype-) "MyPackage/CustomServMess")
(setf (get MyPackage::CustomServMess :request) MyPackage::CustomServMessRequest)
(setf (get MyPackage::CustomServMess :response) MyPackage::CustomServMessResponse)

(defmethod MyPackage::CustomServMessRequest
  (:response () (instance MyPackage::CustomServMessResponse :init)))

(setf (get MyPackage::CustomServMessRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get MyPackage::CustomServMessRequest :datatype-) "MyPackage/CustomServMessRequest")
(setf (get MyPackage::CustomServMessRequest :definition-)
      "
---
")

(setf (get MyPackage::CustomServMessResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get MyPackage::CustomServMessResponse :datatype-) "MyPackage/CustomServMessResponse")
(setf (get MyPackage::CustomServMessResponse :definition-)
      "
---
")



(provide :MyPackage/CustomServMess "d41d8cd98f00b204e9800998ecf8427e")


