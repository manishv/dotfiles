(load-library "autopair")
(load-library "fill-column-indicator")


(defun todo-highlight ()
  (font-lock-add-keywords nil
			  '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

(defun my-python-mode-common-hook()
  (todo-highlight)
  (which-function-mode t)
  (if (> emacs-major-version 22)
      (linum-mode t))
  (setq show-trailing-whitespace t)
  (autopair-mode)
  (fci-mode)
)

(add-hook 'python-mode-hook 'my-python-mode-common-hook)

(provide 'mpv-python)