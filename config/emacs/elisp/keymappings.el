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
    "fd" '(treemacs :which-key "treemacs")

    "g"  '(:ignore t :which-key "git")
    "gs" '(magit-status :which-key "git status")

    "d"  '(:ignore t :which-key "debug")
    "dd" '(dap-debug :which-key "start debugging")
    "dba" '(dap-breakpoint-add :which-key "add breakpoint")
    "dbd" '(dap-breakpoint-delete :which-key "delete breakpoint")
    "dr" '(dap-ui-repl :which-key "repl")
    "du" '(dap-ui-mode :which-key "ui")

    "h"  '(:ignore t :which-key "helpful")
    "hv" '(helpful-variable :which-key "helpful variable")
    "hC" '(helpful-callable :which-key "helpful callable")
    "hk" '(helpful-key :which-key "helpful key")
    "hp" '(helpful-at-point :which-key "helpful at point")
    "hf" '(helpful-function :which-key "helpful function")
    "hc" '(helpful-command :which-key "helpful command")

    "o"  '(:ignore t :which-key "org mode")
    "oa" '(org-agenda :which-key "org agenda")
    "ot" '(counsel-org-tag :which-key "org tag")
    "ose" '(org-set-effort :which-key "org set effort")
    "oc" '(org-capture :which-key "org capture")
    "obt" '(org-babel-tangel :which-key "org babel tangel")

    "s"  '(:ignore t :which-key "system")
    "st" '(eshell :which-key "eshell")
    "sb" '(split-window-below :which-key "split window below")
    "sr" '(split-window-right :which-key "split window right")

    ))

(provide 'keymappings)
;;; keymappings.el ends here
