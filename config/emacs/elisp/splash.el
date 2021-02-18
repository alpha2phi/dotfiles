;; Dependencies
(use-package page-break-lines)
(use-package all-the-icons)
(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.config/emacs/private/cache/recentf"))
  (recentf-mode 1))


(use-package dashboard
  :defer 0
  :config
  (dashboard-setup-startup-hook))

(provide 'splash)

