(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode)
  :init
  (setq projectile-project-search-path '("~/workspace/development/"))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :bind
  ("C-c p" . counsel-projectile-switch-project)
  :config
  (counsel-projectile-mode))

(provide 'workspace)
