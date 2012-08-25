;; Customizations for python programming
(defun todo-highlight ()
  (font-lock-add-keywords nil
			  '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

(load-library "autopair")

(defun my-python-mode-hook()
  (todo-highlight) ;;high the above keywords
  (which-function-mode t)
  (if (> emacs-major-version 22)
      (linum-mode t))
  (autopair-mode)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)
(local-set-key "\C-c\C-c" 'comment-region)
(provide 'mpv-python)
