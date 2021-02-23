;; flycheck syntax checker
(use-package flycheck
  :init (global-flycheck-mode))

;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))
  ; :commands (lsp))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


;; DAP
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; base lang
(provide 'lang)
