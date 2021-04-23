;;; package --- init.el
;;; Commentary:
;;; Initialization file

;;; Code:

;; elisp files
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Base configuration
(require 'base)

;; Theme
(require 'theme)

;; Evil mode
(require 'vim)

;; Completion
(require 'completion)

;; Project management
(require 'workspace)

;; Organize
(require 'organize)

;; Git using Magit
(require 'vcs)

;; Splash screen
(require 'splash)

;; Key mappings
(require 'keymappings)

;; LSP
(require 'lang)   ;; base extensions
(require 'lang-python)
(require 'lang-go)
(require 'lang-rust)
(require 'lang-typescript)
;;; init.el ends here
