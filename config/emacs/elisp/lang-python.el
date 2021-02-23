(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                        (require 'lsp-pyright)
                        (lsp-deferred))))
                        ; (lsp))))


;;; lang python
(provide 'lang-python)
