(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

(require 'remember)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map [(control meta ?r)] 'remember)


(setq org-agenda-files
      (list "J:/Work/Tasks/work.org" "J:/Work/Tasks/tasks.org" ))
(setq org-default-notes-file "J:/Work/Tasks/notes.org")
(setq org-deadline-warning-days 14)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)
(setq org-fast-tag-selection-key t)
(setq org-use-fast-todo-selection t)
(setq org-remember-templates
      '(("Todo" ?t "* TODO %? \nAdded: %U" "J:/Work/Tasks/tasks.org" "TASKS")
	("Note" ?n "* %U %?\n %i " "J:/Work/Tasks/notes.org")))

(provide 'mpv-org)