;; Dependencies
(use-package page-break-lines)
(use-package all-the-icons)

(use-package dashboard
  :ensure t
  :config
  (setq show-week-agenda-p t)
  (setq dashboard-items '((recents . 15) (agenda . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 3)
  (dashboard-setup-startup-hook)
  )

(provide 'splash)
