(use-package general
  :after evil
  :config
  (general-create-definer alpha2phi/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (alpha2phi/leader-keys
    "t"  '(:ignore t :which-key "theme")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "p"  '(:ignore t :which-key "project")
    "pp" '(counsel-projectile-switch-project :which-key "choose project")
    "pc" '(projectile-command-map :which-key "choose action")
    "f"  '(:ignore t :which-key "find")
    "ff" '(counsel-fzf :which-key "fuzzy find")
    "fx" '(counsel-M-x :which-key "M-x")
    ))

(provide 'keymappings)

