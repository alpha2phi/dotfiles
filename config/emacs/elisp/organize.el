;;; organize.el --- org mode configuration

;;; Commentary:
;; All org mode configurations should be here

;;; Code:
(defun alpha2phi/org-mode-setup ()
  "Org mode setup."
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))


;; Replace list hyphen with dot
(defun alpha2phi/org-font-setup ()
  "Font setup."
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
)

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . alpha2phi/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
      '("~/workspace/personal/myself/notes/my_notes.org"
	"~/workspace/personal/myself/notes/my_notes_1.org"))

 (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

 ;;(setq org-refile-targets
       ;;'(("Archive.org" :maxlevel . 1)
	 ;;("Tasks.org" :maxlevel . 1)))

 ;; Save Org buffers after refiling!
 (advice-add 'org-refile :after 'org-save-all-org-buffers)

 (setq org-tag-alist
    '((:startgroup)
       ; Put mutually exclusive tags here
       (:endgroup)
       ("@errand" . ?E)
       ("@home" . ?H)
       ("@work" . ?W)
       ("agenda" . ?a)
       ("planning" . ?p)
       ("publish" . ?P)
       ("batch" . ?b)
       ("note" . ?n)
       ("idea" . ?i)))

  (alpha2phi/org-font-setup)
)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


(defun alpha2phi/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . alpha2phi/org-mode-visual-fill))


(setq org-plantuml-jar-path
      (expand-file-name "~/workspace/software/plantuml/plantuml.jar"))

(setq plantuml-default-exec-mode 'jar)

;;  org-babel configuration
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (plantuml . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python :results output"))

;; Automatically tangle our Emacs.org config file when we save it
(defun alpha2phi/org-babel-tangle-config ()
  "Auto tangle."
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/workspace/development/alpha2phi/dotfiles/config/emacs_config.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'alpha2phi/org-babel-tangle-config)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)
(push '("plantuml" . plantuml) org-src-lang-modes)

;; No numbering when export
(setq org-export-with-section-numbers nil)

;; Always use begin_example
(setq org-babel-min-lines-for-block-output 0)

(provide 'organize)
;;; organize.el ends here
