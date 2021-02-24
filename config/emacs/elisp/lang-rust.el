(use-package toml-mode)

(use-package rust-mode
  :hook ((before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

;; Add keybindings for interacting with Cargo
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(setq lsp-prefer-capf t)
(setq lsp-completion-provider :capf)
(setq lsp-completion-enable t)

(provide 'lang-rust)
