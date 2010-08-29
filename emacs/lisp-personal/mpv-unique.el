;; Uniquify
;;   - makes buffer names unique
(require 'uniquify)
(setq uniquify-separator ":")
(setq uniquify-buffer-name-style 'post-forward)

(provide 'mpv-unique)