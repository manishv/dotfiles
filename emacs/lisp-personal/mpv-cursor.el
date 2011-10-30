;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type

(setq mpv-read-only-color       "gray")
(setq mpv-read-only-cursor-type 'box)
(setq mpv-overwrite-color       "red")
(setq mpv-overwrite-cursor-type 'bar)
(setq mpv-normal-color          "black")
(setq mpv-normal-cursor-type    'box)


(defun set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."

  (cond
    (buffer-read-only
      (set-cursor-color mpv-read-only-color)
      (setq cursor-type mpv-read-only-cursor-type))
    (overwrite-mode
      (set-cursor-color mpv-overwrite-color)
      (setq cursor-type mpv-overwrite-cursor-type))
    (t 
      ;; (set-cursor-color mpv-normal-color)
     (setq cursor-type mpv-normal-cursor-type)
      )
    ))

(add-hook 'post-command-hook 'set-cursor-according-to-mode)

(provide 'mpv-cursor)