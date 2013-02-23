

(require 'workgroups)

(setq wg-prefix-key (kbd "C-o"))

; enable workgroups
(workgroups-mode t)

; disable morphing of the workgroups
(setq wg-morph-on nil)


(defvar wg-filename "~/.emacs.d/saved_workgroups/workgroups.txt")
(if (file-exists-p wg-filename)
    (wg-load wg-filename))


(defun wg-mpv-load ()
  (interactive)
  (wg-load wg-filename))

(defun wg-mpv-save ()
  (interactive)
  (wg-save wg-filename))

(provide 'mpv-workgroups)
