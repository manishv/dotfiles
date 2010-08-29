
(defun move-previous-window (&optional n)
  "Select a previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'move-previous-window)

(provide 'mpv-move)
