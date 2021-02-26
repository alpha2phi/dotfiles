; (use-package spacemacs-theme
;   :defer t
;   :init
;   (load-theme 'spacemacs-dark t))

(use-package doom-themes
  :init (load-theme 'doom-palenight t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(provide 'theme)
