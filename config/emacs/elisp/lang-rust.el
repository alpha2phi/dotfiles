(use-package toml-mode)

(use-package rust-mode
  :hook ((rust-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports))
        :config
          ; (setq lsp-prefer-capf t)
          ; (setq lsp-completion-provider :capf)
          (setq lsp-completion-enable t))

;; Add keybindings for interacting with Cargo
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(provide 'lang-rust)
