(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                        (require 'lsp-pyright)
                        (lsp-deferred))))

;;; lang python
(provide 'lang-python)
