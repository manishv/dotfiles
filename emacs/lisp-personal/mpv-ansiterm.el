(require 'cl)
(require 'term)


(defvar sw-open-in-new-frame nil)
(defvar sw-remove-dead-terms t)


(defun sw-shell-get-process (buffer-name)
  (let ((buffer (get-buffer (concat "*" buffer-name "*"))))
    (and (buffer-live-p buffer) (get-buffer-process buffer))))

(defun sw-get-process-if-live (buffer-name)
  (let ((proc (sw-shell-get-process buffer-name)))
    (and (processp proc)
         (equal (process-status proc) 'run)
         proc)))

(defun sw-kill-buffer-if-no-process (buffer-name)
  (let* ((buffer (get-buffer (concat "*" buffer-name "*")))
         (proc (sw-get-process-if-live buffer-name)))
    (when (and (not proc) (buffer-live-p buffer)) (kill-buffer buffer))))

(defalias 'sw-shell-exists-p 'sw-get-process-if-live)

(defun sw-basic-shell (buffer-name)
  (sw-kill-buffer-if-no-process buffer-name)
  ;; If there is a process running, leave it, otherwise
  ;; create the new buffer
  (if (sw-shell-exists-p buffer-name)
      (message "Buffer already exists")
    (ansi-term "bash" buffer-name))
  (switch-to-buffer (concat "*" buffer-name "*")))

(defun sw-shell/commands (buffer-name &rest commands)
  (sw-basic-shell buffer-name)
  (let ((proc (sw-shell-get-process buffer-name)))
    (dolist (cmd commands)
      (term-simple-send proc cmd))))

(defun sw-set-keymap ()
  (term-set-escape-char ?\C-z)
  (define-key term-raw-map "\C-c" 'term-interrupt-subjob)
  (define-key term-raw-map "\C-y" 'yank)
  (define-key term-raw-map (kbd "\M-x") 'execute-extended-command)
  (define-key term-raw-map "\e" 'term-send-raw)
  (define-key term-raw-map (quote [C-prior]) (quote scroll-down)) 
  (define-key term-raw-map (quote [C-next]) (quote scroll-up))
  ;; (define-key term-raw-map (kbd "\C-") 'scroll-down)
  ;; (define-key term-raw-map (kbd "") 'scroll-up))
)

(sw-set-keymap)

;; Functions to get the mouse working more-or-less as I like it

(defun sw-mouse-paste-clipboard (click arg)
  (interactive "e\nP")
  (let ((proc (get-buffer-process (current-buffer))))
    (term-send-string proc (current-kill 0)))
  (setq deactivate-mark t))

(defun sw-mouse-copy-region-to-clipboard (click)
  (interactive "e")
  (mouse-set-region click)
  (let ((transient-mark-mode nil))
    (copy-region-as-kill (region-beginning) (region-end))))

(define-key term-raw-map
  [drag-mouse-1]
  'sw-mouse-copy-region-to-clipboard)

(define-key term-raw-map [mouse-3] 'sw-mouse-paste-clipboard)

(set-default 'ansi-term-color-vector
	     [unspecified "black" "red1" "green1" "yellow1" "SkyBlue2"
			  "magenta1" "cyan3" 'term-default-bg-color])

(provide 'mpv-ansiterm)