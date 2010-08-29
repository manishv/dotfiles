(require 'dbus)
(defun send-desktop-notification (summary body timeout)
  "call notification-daemon method METHOD with ARGS over dbus"
  (dbus-call-method
   :session                        ; use the session (not system) bus
   "org.freedesktop.Notifications" ; service name
   "/org/freedesktop/Notifications"   ; path name
   "org.freedesktop.Notifications" "Notify" ; Method
   "emacs"
     0
     ""
     summary
     body
     '(:array)
     '(:array :signature "{sv}")
     ':int32 timeout))

(defun pw/compile-notify ()
  (interactive)
  (send-desktop-notification "emacs compile" "message" 0))
