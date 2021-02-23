;;; Initialization file

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

;; Git using Magit
(require 'vcs)

;; Splash screen
(require 'splash)

;; LSP
(require 'lang)   ;; base extensions
; (require 'lang-python)

;; Key mappings
(require 'keymappings)
