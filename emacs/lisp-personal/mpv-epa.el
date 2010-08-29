;;my personal customizations to EasyPG
(require 'epa)

(set-variable (quote epg-gpg-program) 
	      (quote "c:/Program Files/GNU/GnuPG/gpg") nil)

(epa-file-enable)

(provide 'mpv-epa)