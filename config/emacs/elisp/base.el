;; Set default font size
(defvar alpha2phi/default-font-size 160)
(set-face-attribute 'default nil :height alpha2phi/default-font-size)

;; Package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Emacs customizations
(setq custom-file                        "~/.config/emacs/custom.el"
      use-package-always-ensure          t)

(show-paren-mode 1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(load custom-file)

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base)
