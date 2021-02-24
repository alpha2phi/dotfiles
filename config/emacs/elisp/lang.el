;; flycheck syntax checker
(use-package flycheck
  :init (global-flycheck-mode))

;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package company-lsp
  :commands company-lsp)

;;Optional - provides snippet support.

(use-package yasnippet
  :commands yas-minor-mode
  :hook (
         (go-mode . yas-minor-mode)
         (python-mode . yas-minor-mode)
         ))

(setq lsp-ui-doc-enable t
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

;; DAP
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; base lang
(provide 'lang)
