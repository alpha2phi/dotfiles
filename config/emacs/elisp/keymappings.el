;;; keymappings.el --- Key mappings
;;; Commentary:
;;; General key mappings


;;; Code:
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
    "fb" '(switch-to-buffer :which-key "switch buffer")
    "fx" '(counsel-M-x :which-key "M-x")

    "g"  '(:ignore t :which-key "git")
    "gs" '(magit-status :which-key "git status")

    "d"  '(:ignore t :which-key "debug")
    "dd" '(dap-debug :which-key "start debugging")
    "dba" '(dap-breakpoint-add :which-key "add breakpoint")
    "dbd" '(dap-breakpoint-delete :which-key "delete breakpoint")
    "dr" '(dap-ui-repl :which-key "repl")
    "du" '(dap-ui-mode :which-key "ui")

    "hv" '(helpful-variable :which-key "helpful variable")
    "hC" '(helpful-callable :which-key "helpful callable")
    "hk" '(helpful-key :which-key "helpful key")
    "hp" '(helpful-at-point :which-key "helpful at point")
    "hf" '(helpful-function :which-key "helpful function")
    "hc" '(helpful-command :which-key "helpful command")

    ))

(provide 'keymappings)
;;; keymappings.el ends here
