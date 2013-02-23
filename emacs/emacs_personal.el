;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)
;;Stops accidental killing of emacs
(set-variable 'confirm-kill-emacs 'yes-or-no-p) 

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)
(show-paren-mode t)
  
;; Toogle tool bar mode
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ;; Scroll bar on the right
;; (if (> emacs-major-version 22)
;;   (scroll-bar-mode (quote right)))

;; Line-wrapping
(set-default 'fill-column 80)

;; Display time mode
(display-time-mode 1)

;; Base text mode
(setq default-major-mode 'text-mode)
(line-number-mode 1)
(column-number-mode 1)
(setq-default inhibit-eol-conversion t)
 
;; For tramp mode, set password expiry time to 1 hour
(set-default 'password-cache-expiry 3600)

;; Ignore case on completion
(setq completion-ignore-case t
  read-file-name-completion-ignore-case t)

;; ;; Default font
;; (if (> emacs-major-version 22)
;;     (set-default-font "Bitstream Vera Sans Mono-10"))

;; No splash screen
(setq inhibit-splash-screen t)

;; Turn on the flyspell mode for check text.
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
; Temporarily disabling flyspell mode, currently aspell causes my VM to freeze
;(add-hook 'message-mode-hook 'turn-on-flyspell)
;(add-hook 'text-mode-hook 'turn-on-flyspell)
(defun turn-on-flyspell ()
   "Force flyspell-mode on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))

;;place all the backup files in one directory
(defvar user-tmp-dir
  (concat temporary-file-directory "emacs_backups/"  user-login-name "/"))
(make-directory user-tmp-dir t)
(setq backup-by-copying t)
(setq version-control   t)
(setq delete-old-versions t)
(setq kept-new-versions   6)
(setq kept-old-versions   2)
(setq backup-directory-alist (list (cons "." user-tmp-dir)))

;; Keep bookmarks in the load path
(setq bookmark-default-file "~/.emacs.d/emacs-bookmarks")

;; Keep track of last cursor position
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

;; Split the frame horizontally
(setq ediff-split-window-function 'split-window-vertically)

;;Key Bindings
(define-key global-map "\C-c\C-c" 'comment-region)
(define-key global-map "\C-c\k" 'my-compile)
(global-set-key (quote [C-delete]) (quote delete-frame))
(global-set-key (quote [f7]) 'linum-mode)
(global-set-key (quote [f6]) 'flyspell-mode)
(global-set-key "\M-l" 'goto-line)
(global-set-key "\C-cg" 'ascope-find-global-definition)
(global-set-key "\C-cs" 'ascope-find-this-symbol)
(global-set-key "\C-cf" 'ascope-find-functions-calling-this-function)
(global-set-key "\C-x9" 'delete-other-windows-vertically)
 
(if window-system
    (global-set-key "\C-@"  'align-regexp))
(global-set-key (quote [C-space]) 'set-mark-command)
;;load the windmove-default-key bindings
(windmove-default-keybindings)
;; (global-set-key "\C-S-W"  'copy-to-register)
;; (global-set-key "\C-S-Y"  'insert-register)
(global-set-key "\C-h" 'delete-backward-char)

(load-library "sh-script")
(define-key sh-mode-map "\C-c\C-c" 'comment-region)

;; Use ANSI colors within shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Aliases of common used emacs functions
(defalias 'rb 'revert-buffer)
(defalias 'dtw 'delete-trailing-whitespace)

;; Load os specific customization
(if (eq system-type 'gnu/linux)
    (require 'mpv-linux))
(if (eq system-type 'darwin)
    (require 'mpv-macos))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; (setq org-agenda-files (list "~/Documents/Dropbox/MobileOrg/personal_tasks.org" 
;; 			     "/data/work/GTD/monthly_tasks.org"))
