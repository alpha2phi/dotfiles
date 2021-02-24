(use-package go-mode
  :hook ((before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

(provide 'lang-go)
