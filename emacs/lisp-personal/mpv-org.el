(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

;; (require 'remember)
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (define-key global-map [(control meta ?r)] 'remember)


(setq org-deadline-warning-days 14)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)
(setq org-fast-tag-selection-key t)
(setq org-use-fast-todo-selection t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(local-unset-key (quote [S-down]))
(local-unset-key (quote [S-up]))
(setq org-log-done t)
(setq org-agenda-files (list "~/work/tasks/office-tasks.org"
			     "~/work/tasks/personal-tasks.org"))

(provide 'mpv-org)