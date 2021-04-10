;;; completion.el --- Completion settings
;;; Commentary:
;;;    Completion settings

;;; Code:
(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ; ("M-y" . counsel-yank-pop)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-fzf)
  ("C-x c k" . counsel-yank-pop))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :config
      (add-hook 'after-init-hook 'global-company-mode)
      (setq company-tooltip-align-annotations t)
      (setq company-minimum-prefix-length 1)
  :bind (:map company-active-map
      ("C-n" . company-select-next-or-abort)
      ("C-p" . company-select-previous-or-abort)
      ("<tab>" . company-complete-selection))
      (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
      :custom
        (company-minimum-prefix-length 1)
        (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

; (use-package ivy-posframe
;   :config
;   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;   (ivy-posframe-mode 1))
;   ; (when (display-graphic-p) (ivy-posframe-mode)))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(provide 'completion)
;;; completion.el ends here
