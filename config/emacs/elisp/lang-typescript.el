(use-package typescript-mode
             :hook (typescript-mode . lsp-deferred)
             :config
             (setq typescript-indent-level 2))


(provide 'lang-typescript)
