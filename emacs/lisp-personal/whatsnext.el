(require 'org-agenda)
(defun run ()
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-files (list "~/work/tasks/office-tasks.org"))
   (org-batch-agenda "a"))