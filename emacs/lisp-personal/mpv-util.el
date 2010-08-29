; Toggle window dedication
(defun toggle-window-dedicated ()
"Toggle whether the current active window is dedicated or not"
(interactive)
(message
(if (let (window (get-buffer-window (current-buffer)))
   (set-window-dedicated-p window
        (not (window-dedicated-p window))))
"Window '%s' is dedicated"
"Window '%s' is normal")
(current-buffer)))