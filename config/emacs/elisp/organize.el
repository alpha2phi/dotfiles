;;; organize.el --- org mode configuration

;;; Commentary:
;; All org mode configurations should be here

;;; Code:
(defun alpha2phi/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))


(defun alpha2phi/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . alpha2phi/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (alpha2phi/org-font-setup)
)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Set faces for heading levels
(with-eval-after-load 'org-faces (dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
		(org-level-3 . 1.05)
		(org-level-4 . 1.0)
		(org-level-5 . 1.1)
		(org-level-6 . 1.1)
		(org-level-7 . 1.1)
		(org-level-8 . 1.1)))
(set-face-attribute (car face) nil :weight 'regular :height (cdr face))))

(defun alpha2phi/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . alpha2phi/org-mode-visual-fill))

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))


(provide 'organize)
;;; organize.el ends here
