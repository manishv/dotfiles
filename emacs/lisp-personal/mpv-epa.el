;;my personal customizations to EasyPG
(require 'epa)

(set-variable (quote epg-gpg-program) 
	      (quote "gpg") nil)

(epa-file-enable)

(provide 'mpv-epa)