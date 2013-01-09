;; Customizations for C/C++ Programming


(defun todo-highlight ()
  (font-lock-add-keywords nil
			  '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

(load-library "hideshow")
(load-library "autopair")
(load-library "fill-column-indicator")

(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "stroustrup")
  ;; other customizations
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  (todo-highlight)  ;;highlights the above keywords
  (hs-minor-mode)   ;;hides/shows C-code segments
  (which-function-mode t) ;; displays the name of the current function in the mode bar
  ;;use linum mode
  (if (> emacs-major-version 22)
    (linum-mode t))
  (setq show-trailing-whitespace t)
  (autopair-mode)
  (fci-mode)
)

(global-set-key "\C-c'" 'hs-hide-block)
(global-set-key "\C-c#" 'hs-show-block)


(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun javadoc-method-comment ()
  ;; Insert a javadoc method comment at the cursor position
  (interactive)
  (insert
"/**
 *
 *
 *
 *
 * @param
 * @return
 * @see
 **/
")
  (previous-line 8)
  (end-of-line))

(global-set-key "\C-cj" 'javadoc-method-comment)

;;My personal function for compiling files
(require 'compile)
;;;###autoload
(defun my-compile (command &optional comint)
  (interactive
   (list
    (let ((command (eval compile-command)))
      (if (or compilation-read-command current-prefix-arg)
	  (compilation-read-command command)
	command))
    (consp current-prefix-arg)))
  (unless (equal command (eval compile-command))
    (setq compile-command command))
  (setq-default compilation-directory default-directory)
  (setq pop-up-frames t)
  (compile command comint)
;;  (set-window-dedicated-p ())
  (setq pop-up-frames nil)
)

(provide 'mpv-c)
