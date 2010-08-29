;;My customization of ido mode
(require 'ido)
(ido-mode t)

;;enable the fuzzy matching of ido
(setq ido-enable-flex-matching t)

;;enable creating new buffers
(setq ido-create-new-buffer 'always)

(provide 'mpv-ido)