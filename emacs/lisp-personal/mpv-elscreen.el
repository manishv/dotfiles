(load "elscreen" "ElScreen" )

;; F9 creates a new elscreen, shift-F9 kills it
(global-set-key (quote [f9]) 'elscreen-create)
(global-set-key (quote [S-f9]) 'elscreen-kill)  


;; CTRL+PgUP/PgDown switches between elscreens
(global-unset-key (quote [C-next]))
(global-unset-key (quote [C-prior]))

(global-set-key (quote [C-prior]) 'elscreen-previous) 
(global-set-key (quote [C-next])  'elscreen-next)

(provide 'mpv-elscreen)